from typing import Any

from fastapi import APIRouter, HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import select

from app.api.deps import CurrentUser, SessionDep
from app.models import Category, CategoryCreate, CategoryPublic, CategoryUpdate, Message

router = APIRouter()


@router.get("/", response_model=Page[CategoryPublic])
def read_categories(session: SessionDep) -> Page[CategoryPublic]:
    """
    Retrieve categories.
    """

    query = select(Category).order_by(Category.updated_at.desc())

    return paginate(session, query)


@router.get("/{id}", response_model=CategoryPublic)
def read_category(session: SessionDep, id: int) -> Any:
    """
    Get category by ID.
    """
    category = session.get(Category, id)
    if not category:
        raise HTTPException(status_code=404, detail="Category not found")
    return category


@router.post("/", response_model=CategoryPublic)
def create_category(
    *, session: SessionDep, current_user: CurrentUser, category_in: CategoryCreate
) -> Any:
    """
    Create new category.
    """
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    category = Category.model_validate(category_in)
    session.add(category)
    session.commit()
    session.refresh(category)
    return category


@router.patch("/{id}", response_model=CategoryPublic)
def update_category(
    *,
    session: SessionDep,
    current_user: CurrentUser,
    id: int,
    category_in: CategoryUpdate,
) -> Any:
    """
    Update an category.
    """
    category = session.get(Category, id)
    if not category:
        raise HTTPException(status_code=404, detail="Category not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    update_dict = category_in.model_dump(exclude_unset=True)
    category.sqlmodel_update(update_dict)
    session.add(category)
    session.commit()
    session.refresh(category)
    return category


@router.delete("/{id}")
def delete_category(session: SessionDep, current_user: CurrentUser, id: int) -> Message:
    """
    Delete an category.
    """
    category = session.get(Category, id)
    if not category:
        raise HTTPException(status_code=404, detail="Category not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(category)
    session.commit()
    return Message(message="Category deleted successfully")
