from app.models import Category
from app.models import CategoryCreate
from sqlmodel import Session


def create_category(*, session: Session,
                    category_in: CategoryCreate) -> Category:
    """

    :param *:
    :param session: Session:
    :param category_in: CategoryCreate:

    """
    db_category = Category.model_validate(category_in)
    session.add(db_category)
    session.commit()
    session.refresh(db_category)
    return db_category
