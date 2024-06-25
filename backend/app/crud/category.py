from app.models import Category, CategoryCreate  # type: ignore[attr-defined]
from sqlmodel import Session


def create_category(*, session: Session, category_in: CategoryCreate) -> Category:
    db_category = Category.model_validate(category_in)
    session.add(db_category)
    session.commit()
    session.refresh(db_category)
    return db_category
