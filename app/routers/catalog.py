import math

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import and_, func, select
from sqlalchemy.orm import Session

from ..deps import get_db
from ..images import resolve_image
from ..models import ProductCategory, ProductInventory
from ..schemas import CategoryOut, ProductOut, ProductPage

router = APIRouter(prefix="/api", tags=["catalog"])


def to_product_out(p: ProductInventory, category_name: str) -> ProductOut:
    image_url, has_image = resolve_image(p.image_url)
    return ProductOut(
        product_id=p.product_id,
        category_id=p.category_id,
        category_name=category_name,
        sku=p.sku,
        name=p.name,
        brand=p.brand,
        description=p.description,
        abv=float(p.abv) if p.abv is not None else None,
        volume_ml=p.volume_ml,
        price=float(p.price),
        quantity_in_stock=p.quantity_in_stock,
        in_stock=p.quantity_in_stock > 0,
        image_url=image_url,
        has_image=has_image,
    )


def fetch_page(db: Session, filters: list, page: int, page_size: int) -> ProductPage:
    join_on = ProductCategory.category_id == ProductInventory.category_id
    base_filters = [ProductInventory.is_active.is_(True), ProductCategory.is_active.is_(True)]

    total = db.scalar(
        select(func.count())
        .select_from(ProductInventory)
        .join(ProductCategory, join_on)
        .where(*base_filters, *filters)
    ) or 0

    rows = db.execute(
        select(ProductInventory, ProductCategory.name)
        .join(ProductCategory, join_on)
        .where(*base_filters, *filters)
        .order_by(ProductInventory.name)
        .limit(page_size)
        .offset((page - 1) * page_size)
    ).all()

    return ProductPage(
        items=[to_product_out(p, cat_name) for p, cat_name in rows],
        total=total,
        page=page,
        page_size=page_size,
        total_pages=math.ceil(total / page_size) if total else 0,
    )


@router.get("/categories", response_model=list[CategoryOut])
def list_categories(db: Session = Depends(get_db)):
    rows = db.execute(
        select(ProductCategory, func.count(ProductInventory.product_id))
        .outerjoin(
            ProductInventory,
            and_(
                ProductInventory.category_id == ProductCategory.category_id,
                ProductInventory.is_active.is_(True),
            ),
        )
        .where(ProductCategory.is_active.is_(True))
        .group_by(ProductCategory.category_id)
        .order_by(ProductCategory.name)
    ).all()

    return [
        CategoryOut(
            category_id=c.category_id,
            name=c.name,
            description=c.description,
            product_count=count,
        )
        for c, count in rows
    ]


@router.get("/products", response_model=ProductPage)
def list_products(
    category_id: int | None = None,
    q: str | None = Query(None, min_length=2, max_length=100, description="Search name or brand"),
    in_stock_only: bool = False,
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    db: Session = Depends(get_db),
):
    filters = []
    if category_id is not None:
        filters.append(ProductInventory.category_id == category_id)
    if q:
        like = f"%{q}%"
        filters.append(ProductInventory.name.like(like) | ProductInventory.brand.like(like))
    if in_stock_only:
        filters.append(ProductInventory.quantity_in_stock > 0)
    return fetch_page(db, filters, page, page_size)


@router.get("/categories/{category_id}/products", response_model=ProductPage)
def list_category_products(
    category_id: int,
    in_stock_only: bool = False,
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    db: Session = Depends(get_db),
):
    category = db.get(ProductCategory, category_id)
    if not category or not category.is_active:
        raise HTTPException(404, "Category not found")

    filters = [ProductInventory.category_id == category_id]
    if in_stock_only:
        filters.append(ProductInventory.quantity_in_stock > 0)
    return fetch_page(db, filters, page, page_size)


@router.get("/products/{product_id}", response_model=ProductOut)
def get_product(product_id: int, db: Session = Depends(get_db)):
    row = db.execute(
        select(ProductInventory, ProductCategory.name)
        .join(ProductCategory, ProductCategory.category_id == ProductInventory.category_id)
        .where(
            ProductInventory.product_id == product_id,
            ProductInventory.is_active.is_(True),
            ProductCategory.is_active.is_(True),
        )
    ).first()
    if not row:
        raise HTTPException(404, "Product not found")
    return to_product_out(*row)