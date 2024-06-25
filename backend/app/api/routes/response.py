from typing import Any

from fastapi import APIRouter, HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import func, select

from app.api.deps import CurrentUser, SessionDep
from app.models import (
    Message,
    Question,
    Response,
    ResponseCreate,
    ResponsePublic,
    ResponseUpdate,
)

router = APIRouter()


@router.get("/{question_id}", response_model=Page[ResponsePublic])
def read_responses(session: SessionDep, question_id: int) -> Page[ResponsePublic]:
    """
    Retrieve responses.
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
    """
    Get response by ID.
    """
    response = session.get(Response, id)
    if not response:
        raise HTTPException(status_code=404, detail="Response not found")
    return response


@router.post("/", response_model=ResponsePublic)
def create_response(
    *, session: SessionDep, current_user: CurrentUser, response_in: ResponseCreate
) -> Any:
    """
    Create new response.
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
    """
    Update an response.
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
    """
    Delete an response.
    """
    response = session.get(Response, id)
    if not response:
        raise HTTPException(status_code=404, detail="Response not found")
    if not current_user.is_superuser and (response.owner_id != current_user.id):
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(response)
    session.commit()
    return Message(message="Response deleted successfully")
