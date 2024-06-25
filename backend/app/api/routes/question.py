from typing import Any

from app.api.deps import CurrentUser
from app.api.deps import SessionDep
from app.models import Message
from app.models import Question
from app.models import QuestionCreate
from app.models import QuestionPublic
from app.models import QuestionUpdate
from fastapi import APIRouter
from fastapi import HTTPException
from fastapi_pagination import Page
from fastapi_pagination.ext.sqlmodel import paginate
from sqlmodel import func
from sqlmodel import select

router = APIRouter()


@router.get("/", response_model=Page[QuestionPublic])
def read_questions(session: SessionDep) -> Page[QuestionPublic]:
    """Retrieve questions.

    :param session: SessionDep: 

    """

    query = select(Question).order_by(func.random())

    return paginate(session, query)


@router.get("/{id}", response_model=QuestionPublic)
def read_question(session: SessionDep, id: int) -> Any:
    """Get question by ID.

    :param session: SessionDep: 
    :param id: int: 

    """
    question = session.get(Question, id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    return question


@router.post("/", response_model=QuestionPublic)
def create_question(
    *, session: SessionDep, current_user: CurrentUser, question_in: QuestionCreate
) -> Any:
    """Create new question.

    :param *: 
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param question_in: QuestionCreate: 

    """
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
    """Update an question.

    :param *: 
    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param id: int: 
    :param question_in: QuestionUpdate: 

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
    """Delete an question.

    :param session: SessionDep: 
    :param current_user: CurrentUser: 
    :param id: int: 

    """
    question = session.get(Question, id)
    if not question:
        raise HTTPException(status_code=404, detail="Question not found")
    if not current_user.is_superuser:
        raise HTTPException(status_code=400, detail="Not enough permissions")
    session.delete(question)
    session.commit()
    return Message(message="Question deleted successfully")
