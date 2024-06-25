from sqlmodel import Field, Relationship

from app.models import SQLModel  # type: ignore[attr-defined]

from .base import TimeStampedModel
from .question import Question, QuestionPublic
from .user import User, UserPublic


# Shared properties
class ResponseBase(SQLModel):
    """ """

    text: str = Field(index=True)
    point: int = Field(default=0, nullable=False)


# Properties to receive on item creation
class ResponseCreate(ResponseBase):
    """ """

    text: str
    point: int


# Properties to receive on item update
class ResponseUpdate(ResponseBase):
    """ """

    text: str | None = None  # type: ignore
    point: int | None = None  # type: ignore


# Database model, database table inferred from class name
class Response(ResponseBase, TimeStampedModel, table=True):
    """ """

    id: int | None = Field(default=None, primary_key=True)
    text: str
    question_id: int | None = Field(
        default=None, foreign_key="question.id", nullable=False
    )
    question: Question | None = Relationship(back_populates="responses")
    owner_id: int | None = Field(
        default=None, foreign_key="user.id", nullable=False)
    owner: User | None = Relationship(back_populates="responses")

    def __str__(self) -> str:
        return self.text


# Properties to return via API, id is always required
class ResponsePublic(ResponseBase, TimeStampedModel):
    """ """

    id: int
    question_id: int
    question: QuestionPublic
    owner_id: int
    owner: UserPublic
