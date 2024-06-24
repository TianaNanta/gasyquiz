from typing import TYPE_CHECKING

from sqlmodel import Field, Relationship

from app.models import SQLModel

from .base import TimeStampedModel

if TYPE_CHECKING:
    from .question import Question, QuestionPublic


# Shared properties
class CategoryBase(SQLModel):
    """ """

    name: str = Field(index=True)
    description: str | None = None

# Properties to receive on Category creation
class CategoryCreate(CategoryBase):
    """ """

    name: str


# Properties to receive on Category update
class CategoryUpdate(CategoryBase):
    """ """

    name: str | None = None  # type: ignore


# Database model, database table inferred from class name
class Category(CategoryBase, TimeStampedModel, table=True):
    """ """

    id: int | None = Field(default=None, primary_key=True)
    name: str
    questions: list["Question"] = Relationship(back_populates="category")

    def __str__(self):
        return self.name


# Properties to return via API, id is always required
class CategoryPublic(CategoryBase, TimeStampedModel):
    """ """

    id: int
    questions: list["QuestionPublic"]
