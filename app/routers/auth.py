import hashlib
import secrets
from datetime import date, datetime, timedelta, timezone

from fastapi import APIRouter, BackgroundTasks, Depends, HTTPException, status
from sqlalchemy import func, select, update
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from ..config import settings
from ..deps import get_current_user, get_db
from ..mailer import send_email
from ..models import PasswordResetToken, User
from ..schemas import (
    ForgotPasswordRequest,
    LoginRequest,
    MessageResponse,
    ResetPasswordRequest,
    SignupRequest,
    TokenResponse,
    UserOut,
    ChangePasswordRequest,
)
from ..security import create_access_token, hash_password, verify_password

router = APIRouter(prefix="/api/auth", tags=["auth"])


def is_of_age(dob: date, min_age: int) -> bool:
    today = date.today()
    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    return age >= min_age


@router.post("/signup", response_model=UserOut, status_code=status.HTTP_201_CREATED)
def signup(body: SignupRequest, db: Session = Depends(get_db)):
    if not is_of_age(body.date_of_birth, settings.min_age):
        raise HTTPException(403, f"You must be {settings.min_age}+ to sign up")

    user = User(
        first_name=body.first_name,
        last_name=body.last_name,
        email=body.email.lower(),
        password_hash=hash_password(body.password),
        date_of_birth=body.date_of_birth,
        phone=body.phone,
    )
    db.add(user)
    try:
        db.commit()
    except IntegrityError:
        db.rollback()
        raise HTTPException(409, "Email already registered")
    db.refresh(user)
    return user


@router.post("/login", response_model=TokenResponse)
def login(body: LoginRequest, db: Session = Depends(get_db)):
    user = db.scalar(select(User).where(User.email == body.email.lower()))
    if not user or not user.is_active or not verify_password(body.password, user.password_hash):
        raise HTTPException(401, "Invalid credentials")

    user.last_login_at = func.now()
    db.commit()
    return TokenResponse(access_token=create_access_token(user.user_id))


@router.get("/me", response_model=UserOut)
def me(current_user: User = Depends(get_current_user)):
    return current_user

def _utcnow() -> datetime:
    return datetime.now(timezone.utc).replace(tzinfo=None)


def _hash_token(token: str) -> str:
    return hashlib.sha256(token.encode()).hexdigest()


@router.post("/forgot-password", response_model=MessageResponse)
def forgot_password(
    body: ForgotPasswordRequest,
    background: BackgroundTasks,
    db: Session = Depends(get_db),
):
    generic = MessageResponse(message="If that email is registered, a reset link has been sent.")

    user = db.scalar(select(User).where(User.email == body.email.lower()))
    if not user or not user.is_active:
        return generic  # same answer, so attackers can't tell who is registered

    now = _utcnow()
    # cancel any earlier unused links
    db.execute(
        update(PasswordResetToken)
        .where(PasswordResetToken.user_id == user.user_id, PasswordResetToken.used_at.is_(None))
        .values(used_at=now)
    )

    raw_token = secrets.token_urlsafe(32)
    db.add(
        PasswordResetToken(
            user_id=user.user_id,
            token_hash=_hash_token(raw_token),
            expires_at=now + timedelta(minutes=settings.reset_token_minutes),
        )
    )
    db.commit()

    link = f"{settings.frontend_url.rstrip('/')}/reset-password?token={raw_token}"
    text = (
        f"Hi {user.first_name},\n\n"
        f"Use this link to reset your BombayBooze password:\n{link}\n\n"
        f"It expires in {settings.reset_token_minutes} minutes and works once. "
        "If you didn't ask for this, you can ignore this email."
    )
    # sent after the response, so timing doesn't reveal whether the email exists
    background.add_task(send_email, user.email, "Reset your BombayBooze password", text)
    return generic


@router.post("/reset-password", response_model=MessageResponse)
def reset_password(body: ResetPasswordRequest, db: Session = Depends(get_db)):
    invalid = HTTPException(status.HTTP_400_BAD_REQUEST, "Invalid or expired reset link")
    now = _utcnow()

    record = db.scalar(
        select(PasswordResetToken).where(PasswordResetToken.token_hash == _hash_token(body.token))
    )
    if not record or record.used_at is not None or record.expires_at < now:
        raise invalid

    # claim the token atomically so two requests can't both use it
    claimed = db.execute(
        update(PasswordResetToken)
        .where(PasswordResetToken.token_id == record.token_id, PasswordResetToken.used_at.is_(None))
        .values(used_at=now)
    ).rowcount
    if claimed != 1:
        db.rollback()
        raise invalid

    user = db.get(User, record.user_id)
    if not user or not user.is_active:
        db.rollback()
        raise invalid

    user.password_hash = hash_password(body.new_password)
    db.commit()
    return MessageResponse(message="Password updated. You can now sign in.")

@router.post("/change-password", response_model=MessageResponse)
def change_password(
    body: ChangePasswordRequest,
    background: BackgroundTasks,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    if not verify_password(body.current_password, current_user.password_hash):
        # 400, not 401, so the frontend doesn't treat it as an expired login
        raise HTTPException(status.HTTP_400_BAD_REQUEST, "Current password is incorrect")

    if body.new_password == body.current_password:
        raise HTTPException(status.HTTP_400_BAD_REQUEST, "New password must be different")

    current_user.password_hash = hash_password(body.new_password)

    # cancel any forgot-password links that are still unused
    db.execute(
        update(PasswordResetToken)
        .where(
            PasswordResetToken.user_id == current_user.user_id,
            PasswordResetToken.used_at.is_(None),
        )
        .values(used_at=_utcnow())
    )
    db.commit()

    background.add_task(
        send_email,
        current_user.email,
        "Your BombayBooze password was changed",
        f"Hi {current_user.first_name},\n\nYour password was just changed. "
        "If this wasn't you, reset your password immediately and contact support.",
    )
    return MessageResponse(message="Password changed successfully.")