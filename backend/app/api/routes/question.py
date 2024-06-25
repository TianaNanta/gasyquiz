from typing import Any

from app.api.deps import CurrentUser, SessionDep
from app.models import (Category, Message, Question, QuestionCreate,
                        QuestionPublic, QuestionUpdate)
from fastapi import APIRouter, HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import func, select

router = APIRouter()


@router.get("/", response_model=Page[QuestionPublic])
def read_questions(session: SessionDep) -> Page[QuestionPublic]:
    """
    Retrieve questions.
    """

    query = select(Question).order_by(func.random())

    return paginate(session, query)


@router.get("/{id}", response_model=QuestionPublic)
def read_question(session: SessionDep, id: int) -> Any:
    """
    Get question by ID.
    """
    question = session.get(Question, id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    return question


@router.post("/", response_model=QuestionPublic)
def create_question(
    *, session: SessionDep, current_user: CurrentUser, question_in: QuestionCreate
) -> Any:
    """
    Create new question.
    """
    category = session.get(Category, question_in.category_id)
    if not category:
        raise HTTPException(status_code=404, detail="Category not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    question = Question.model_validate(question_in)
    session.add(question)
    session.commit()
    session.refresh(question)
    return question


@router.patch("/{id}", response_model=QuestionPublic)
def update_question(
    *,
    session: SessionDep,
    current_user: CurrentUser,
    id: int,
    question_in: QuestionUpdate,
) -> Any:
    """
    Update an question.
    """
    question = session.get(Question, id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    update_dict = question_in.model_dump(exclude_unset=True)
    question.sqlmodel_update(update_dict)
    session.add(question)
    session.commit()
    session.refresh(question)
    return question


@router.delete("/{id}")
def delete_question(session: SessionDep, current_user: CurrentUser, id: int) -> Message:
    """
    Delete an question.
    """
    question = session.get(Question, id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(question)
    session.commit()
    return Message(message="Question deleted successfully")
