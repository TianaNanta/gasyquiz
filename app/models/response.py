from sqlmodel import Field, Relationship

from app.models import SQLModel

from .base import TimeStampedModel
from .question import Question, QuestionPublic


# Shared properties
class ResponseFirst(SQLModel):
    """ """

    text: str = Field(index=True)

class ResponseBase(ResponseFirst):
    """ """

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
    question_id: int | None = Field(default=None, foreign_key="question.id", nullable=False)
    question: Question | None = Relationship(back_populates="responses")

    def __str__(self):
        return self.text


# Properties to return via API, id is always required
class ResponsePublic(ResponseFirst, TimeStampedModel):
    """ """

    id: int
    question_id: int
    question: QuestionPublic
