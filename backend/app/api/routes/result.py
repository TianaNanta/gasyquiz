from typing import Any

from fastapi import APIRouter, HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import select

from app.api.deps import CurrentUser, SessionDep
from app.models import Message, Result, ResultCreate, ResultPublic, ResultUpdate

router = APIRouter()


@router.get("/", response_model=Page[ResultPublic])
def read_results(session: SessionDep, current_user: CurrentUser) -> Page[ResultPublic]:
    """
    Retrieve results.
    """

    query = select(Result)
    if not current_user.is_superuser:
        query = query.where(Result.owner_id == current_user.id)
    query = query.order_by(Result.updated_at.desc())

    return paginate(session, query)


@router.get("/{id}", response_model=ResultPublic)
def read_result(session: SessionDep, current_user: CurrentUser, id: int) -> Any:
    """
    Get result by ID.
    """
    result = session.get(Result, id)
    if not result:
        raise HTTPException(status_code=404, detail="Result not found")
    if not current_user.is_superuser and (result.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    return result


@router.post("/", response_model=ResultPublic)
def create_result(
    *, session: SessionDep, current_user: CurrentUser, result_in: ResultCreate
) -> Any:
    """
    Create new result.
    """
    result = Result.model_validate(result_in, update={"owner_id": current_user.id})
    session.add(result)
    session.commit()
    session.refresh(result)
    return result


@router.patch("/{id}", response_model=ResultPublic)
def update_result(
    *,
    session: SessionDep,
    current_user: CurrentUser,
    id: int,
    result_in: ResultUpdate,
) -> Any:
    """
    Update an result.
    """
    result = session.get(Result, id)
    if not result:
        raise HTTPException(status_code=404, detail="Result not found")
    if not current_user.is_superuser and (result.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    update_dict = result_in.model_dump(exclude_unset=True)
    result.sqlmodel_update(update_dict)
    session.add(result)
    session.commit()
    session.refresh(result)
    return result


@router.delete("/{id}")
def delete_result(session: SessionDep, current_user: CurrentUser, id: int) -> Message:
    """
    Delete an result.
    """
    result = session.get(Result, id)
    if not result:
        raise HTTPException(status_code=404, detail="Result not found")
    if not current_user.is_superuser and (result.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(result)
    session.commit()
    return Message(message="Result deleted successfully")
