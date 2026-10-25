import logging
import smtplib
from email.message import EmailMessage

from .config import settings

log = logging.getLogger("uvicorn.error")


def send_email(to: str, subject: str, body: str) -> None:
    if not settings.smtp_host:
        # DEV ONLY: no SMTP configured, so print the email to the API log
        log.warning("SMTP not configured. Email to %s\nSubject: %s\n%s", to, subject, body)
        return

    msg = EmailMessage()
    msg["From"] = settings.smtp_from
    msg["To"] = to
    msg["Subject"] = subject
    msg.set_content(body)

    with smtplib.SMTP(settings.smtp_host, settings.smtp_port, timeout=10) as server:
        if settings.smtp_starttls:
            server.starttls()
        if settings.smtp_user:
            server.login(settings.smtp_user, settings.smtp_password or "")
        server.send_message(msg)