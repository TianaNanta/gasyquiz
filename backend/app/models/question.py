from typing import TYPE_CHECKING

from sqlmodel import Field, Relationship

from app.models import SQLModel  # type: ignore[attr-defined]

from .base import TimeStampedModel
from .category import Category, CategoryPublic

if TYPE_CHECKING:
    from .response import Response


# Shared properties
class QuestionBase(SQLModel):
    """ """

    text: str = Field(index=True)


# Properties to receive on Question creation
class QuestionCreate(QuestionBase):
    """ """

    text: str


# Properties to receive on Question update
class QuestionUpdate(QuestionBase):
    """ """

    text: str | None = None  # type: ignore


# Database model, database table inferred from class name
class Question(QuestionBase, TimeStampedModel, table=True):
    """ """

    id: int | None = Field(default=None, primary_key=True)
    text: str
    category_id: int | None = Field(
        default=None, foreign_key="category.id", nullable=False
    )
    category: Category | None = Relationship(back_populates="questions")
    responses: list["Response"] = Relationship(back_populates="question")

    def __str__(self) -> str:
        return self.text


class ResponsePublic(TimeStampedModel):
    """ """

    id: int
    text: str
    question_id: int


# Properties to return via API, id is always required
class QuestionPublic(QuestionBase, TimeStampedModel):
    """ """

    id: int
    category_id: int
    category: CategoryPublic
    responses: list[ResponsePublic]
