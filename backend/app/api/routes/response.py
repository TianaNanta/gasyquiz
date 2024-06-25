from typing import Any

from app.api.deps import CurrentUser
from app.api.deps import SessionDep
from app.models import Message
from app.models import Question
from app.models import Response
from app.models import ResponseCreate
from app.models import ResponsePublic
from app.models import ResponseUpdate
from fastapi import APIRouter
from fastapi import HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import func
from sqlmodel import select

router = APIRouter()


@router.get("/{question_id}", response_model=Page[ResponsePublic])
def read_responses(session: SessionDep, question_id: int) -> Page[ResponsePublic]:
    """Retrieve responses.

    :param session: SessionDep:
    :param question_id: int:

    """
    question = session.get(Question, question_id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    query = (
        select(Response)
        .where(Response.question_id == question_id)
        .order_by(func.random())
    )

    return paginate(session, query)


@router.get("/unique/{id}", response_model=ResponsePublic)
def read_response(session: SessionDep, id: int) -> Any:
    """Get response by ID.

    :param session: SessionDep:
    :param id: int:

    """
    response = session.get(Response, id)
    if not response:
        raise HTTPException(status_code=404, detail="Response not found")
    return response


@router.post("/", response_model=ResponsePublic)
def create_response(
    *, session: SessionDep, current_user: CurrentUser, response_in: ResponseCreate
) -> Any:
    """Create new response.

    :param *:
    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param response_in: ResponseCreate:

    """
    response = Response.model_validate(
        response_in, update={"owner_id": current_user.id}
    )
    session.add(response)
    session.commit()
    session.refresh(response)
    return response


@router.patch("/{id}", response_model=ResponsePublic)
def update_response(
    *,
    session: SessionDep,
    current_user: CurrentUser,
    id: int,
    response_in: ResponseUpdate,
) -> Any:
    """Update an response.

    :param *:
    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param id: int:
    :param response_in: ResponseUpdate:

    """
    response = session.get(Response, id)
    if not response:
        raise HTTPException(status_code=404, detail="Response not found")
    if not current_user.is_superuser and (response.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    update_dict = response_in.model_dump(exclude_unset=True)
    response.sqlmodel_update(update_dict)
    session.add(response)
    session.commit()
    session.refresh(response)
    return response


@router.delete("/{id}")
def delete_response(session: SessionDep, current_user: CurrentUser, id: int) -> Message:
    """Delete an response.

    :param session: SessionDep:
    :param current_user: CurrentUser:
    :param id: int:

    """
    response = session.get(Response, id)
    if not response:
        raise HTTPException(status_code=404, detail="Response not found")
    if not current_user.is_superuser and (response.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(response)
    session.commit()
    return Message(message="Response deleted successfully")
