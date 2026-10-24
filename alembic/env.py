from logging.config import fileConfig

from alembic import context
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

from app import models  # noqa: F401  (registers tables on Base.metadata)
from app.config import settings
from app.database import Base

config = context.config
if config.config_file_name is not None:
    fileConfig(config.config_file_name)

target_metadata = Base.metadata

url = URL.create(
    "mysql+pymysql",
    username=settings.migration_db_user or settings.db_user,
    password=settings.migration_db_password or settings.db_password,
    host=settings.db_host,
    port=settings.db_port,
    database=settings.db_name,
    query={"charset": "utf8mb4"},
)


def run_migrations_offline() -> None:
    context.configure(
        url=url.render_as_string(hide_password=False),
        target_metadata=target_metadata,
        literal_binds=True,
        compare_type=True,
    )
    with context.begin_transaction():
        context.run_migrations()


def run_migrations_online() -> None:
    engine = create_engine(url)
    with engine.connect() as connection:
        context.configure(
            connection=connection,
            target_metadata=target_metadata,
            compare_type=True,
        )
        with context.begin_transaction():
            context.run_migrations()


if context.is_offline_mode():
    run_migrations_offline()
else:
    run_migrations_online()