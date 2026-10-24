from datetime import date

from pydantic import BaseModel, EmailStr, Field


class SignupRequest(BaseModel):
    first_name: str = Field(min_length=1, max_length=50)
    last_name: str = Field(min_length=1, max_length=50)
    email: EmailStr
    password: str = Field(min_length=8, max_length=64)  # bcrypt caps at 72 bytes
    date_of_birth: date
    phone: str | None = Field(default=None, max_length=20)


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"


class UserOut(BaseModel):
    user_id: int
    first_name: str
    last_name: str
    email: EmailStr
    is_verified: bool

    model_config = {"from_attributes": True}

class CategoryOut(BaseModel):
    category_id: int
    name: str
    description: str | None
    product_count: int


class ProductOut(BaseModel):
    product_id: int
    category_id: int
    category_name: str
    sku: str
    name: str
    brand: str | None
    description: str | None
    abv: float | None
    volume_ml: int
    price: float
    quantity_in_stock: int
    in_stock: bool
    image_url: str      # always usable; placeholder if no real image
    has_image: bool     # false when the placeholder is returned


class ProductPage(BaseModel):
    items: list[ProductOut]
    total: int
    page: int
    page_size: int
    total_pages: int