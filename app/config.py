from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    db_host: str = "127.0.0.1"
    db_port: int = 3306
    db_user: str
    db_password: str
    db_name: str = "BombayBoozeDB"
    migration_db_user: str | None = None
    migration_db_password: str | None = None

    jwt_secret: str
    jwt_algorithm: str = "HS256"
    jwt_expire_minutes: int = 60
    min_age: int = 21
    public_base_url: str = "http://localhost:8000"

    # model_config = SettingsConfigDict(env_file=".env")
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    frontend_url: str = "http://localhost:5173"
    reset_token_minutes: int = 30

    smtp_host: str | None = None
    smtp_port: int = 587
    smtp_user: str | None = None
    smtp_password: str | None = None
    smtp_starttls: bool = True
    smtp_from: str = "BombayBooze <no-reply@bombaybooze.example>"


settings = Settings()