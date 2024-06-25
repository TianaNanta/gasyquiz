from typing import Any

from app.api.deps import CurrentUser
from app.api.deps import SessionDep
from app.models import Message
from app.models import Result
from app.models import ResultCreate
from app.models import ResultPublic
from app.models import ResultUpdate
from fastapi import APIRouter
from fastapi import HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import select

router = APIRouter()


@router.get("/", response_model=Page[ResultPublic])
def read_results(session: SessionDep, current_user: CurrentUser) -> Page[ResultPublic]:
    """Retrieve results.

    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param session: SessionDep: 
    :param current_user: CurrentUser: 

    """

    query = select(Result)
    if not current_user.is_superuser:
        query = query.where(Result.owner_id == current_user.id)
    query = query.order_by(Result.updated_at.desc())

    return paginate(session, query)


@router.get("/{id}", response_model=ResultPublic)
def read_result(session: SessionDep, current_user: CurrentUser, id: int) -> Any:
    """Get result by ID.

    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param id: int:
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param id: int: 

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
    """Create new result.

    :param *: 
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param result_in: ResultCreate: 

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
    """Update an result.

    :param *: 
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param id: int: 
    :param result_in: ResultUpdate: 

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
    """Delete an result.

    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param id: int:
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param id: int: 

    """
    result = session.get(Result, id)
    if not result:
        raise HTTPException(status_code=404, detail="Result not found")
    if not current_user.is_superuser and (result.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(result)
    session.commit()
    return Message(message="Result deleted successfully")
