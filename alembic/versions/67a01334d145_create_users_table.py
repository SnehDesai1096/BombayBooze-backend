"""create users table

Revision ID: 67a01334d145
Revises:
Create Date: 2026-10-14 20:40:00

"""
from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision: str = "67a01334d145"
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        "users",
        sa.Column("user_id", mysql.INTEGER(unsigned=True), autoincrement=True, nullable=False),
        sa.Column("first_name", sa.String(50), nullable=False),
        sa.Column("last_name", sa.String(50), nullable=False),
        sa.Column("email", sa.String(255), nullable=False),
        sa.Column("password_hash", sa.String(255), nullable=False),
        sa.Column("date_of_birth", sa.Date(), nullable=False),
        sa.Column("phone", sa.String(20), nullable=True),
        sa.Column("is_verified", sa.Boolean(), server_default=sa.text("0"), nullable=False),
        sa.Column("is_active", sa.Boolean(), server_default=sa.text("1"), nullable=False),
        sa.Column("created_at", sa.TIMESTAMP(), server_default=sa.text("CURRENT_TIMESTAMP"), nullable=False),
        sa.Column(
            "updated_at",
            sa.TIMESTAMP(),
            server_default=sa.text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"),
            nullable=False,
        ),
        sa.Column("last_login_at", sa.TIMESTAMP(), nullable=True),
        sa.PrimaryKeyConstraint("user_id"),
        sa.UniqueConstraint("email", name="uq_users_email"),
        mysql_engine="InnoDB",
        mysql_default_charset="utf8mb4",
    )


def downgrade() -> None:
    op.drop_table("users")