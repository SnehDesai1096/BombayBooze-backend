from datetime import date

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy import func, select
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from ..config import settings
from ..deps import get_current_user, get_db
from ..models import User
from ..schemas import LoginRequest, SignupRequest, TokenResponse, UserOut
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