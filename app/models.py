from datetime import date, datetime
from decimal import Decimal
from sqlalchemy import TIMESTAMP, Boolean, Date, ForeignKey, Numeric, SmallInteger, String, Text, func, text
from sqlalchemy.dialects.mysql import INTEGER
from sqlalchemy.orm import Mapped, mapped_column, relationship
from .database import Base


class User(Base):
    __tablename__ = "users"

    user_id: Mapped[int] = mapped_column(INTEGER(unsigned=True), primary_key=True, autoincrement=True)
    first_name: Mapped[str] = mapped_column(String(50))
    last_name: Mapped[str] = mapped_column(String(50))
    email: Mapped[str] = mapped_column(String(255), unique=True)
    password_hash: Mapped[str] = mapped_column(String(255))
    date_of_birth: Mapped[date] = mapped_column(Date)
    phone: Mapped[str | None] = mapped_column(String(20), nullable=True)
    is_verified: Mapped[bool] = mapped_column(Boolean, server_default=text("0"))
    is_active: Mapped[bool] = mapped_column(Boolean, server_default=text("1"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now(), onupdate=func.now())
    last_login_at: Mapped[datetime | None] = mapped_column(TIMESTAMP, nullable=True)

class ProductCategory(Base):
    __tablename__ = "product_category"

    category_id: Mapped[int] = mapped_column(INTEGER(unsigned=True), primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(100), unique=True)
    description: Mapped[str | None] = mapped_column(String(255), nullable=True)
    is_active: Mapped[bool] = mapped_column(Boolean, server_default=text("1"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now(), onupdate=func.now())

    products: Mapped[list["ProductInventory"]] = relationship(back_populates="category")


class ProductInventory(Base):
    __tablename__ = "product_inventory"

    product_id: Mapped[int] = mapped_column(INTEGER(unsigned=True), primary_key=True, autoincrement=True)
    category_id: Mapped[int] = mapped_column(
        INTEGER(unsigned=True),
        ForeignKey("product_category.category_id", ondelete="RESTRICT", onupdate="CASCADE"),
        index=True,
    )
    sku: Mapped[str] = mapped_column(String(50), unique=True)
    name: Mapped[str] = mapped_column(String(150))
    brand: Mapped[str | None] = mapped_column(String(100), nullable=True)
    description: Mapped[str | None] = mapped_column(Text, nullable=True)
    abv: Mapped[Decimal | None] = mapped_column(Numeric(4, 2), nullable=True)  # alcohol %, e.g. 40.00
    volume_ml: Mapped[int] = mapped_column(SmallInteger)
    price: Mapped[Decimal] = mapped_column(Numeric(10, 2))
    quantity_in_stock: Mapped[int] = mapped_column(INTEGER(unsigned=True), server_default=text("0"))
    reorder_level: Mapped[int] = mapped_column(INTEGER(unsigned=True), server_default=text("10"))
    image_url: Mapped[str | None] = mapped_column(String(255), nullable=True)
    is_active: Mapped[bool] = mapped_column(Boolean, server_default=text("1"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP, server_default=func.now(), onupdate=func.now())

    category: Mapped["ProductCategory"] = relationship(back_populates="products")