from sqlmodel import Field, Relationship

from app.models import SQLModel

from .base import TimeStampedModel
from .category import Category, CategoryPublic


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
    category_id: int | None = Field(default=None, foreign_key="category.id", nullable=False)
    category: Category | None = Relationship(back_populates="questions")

    def __str__(self):
        return self.text


# Properties to return via API, id is always required
class QuestionPublic(QuestionBase, TimeStampedModel):
    """ """

    id: int
    category_id: int
    category: CategoryPublic
