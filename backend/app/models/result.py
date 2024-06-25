from app.models import SQLModel  # type: ignore[attr-defined]
from sqlmodel import Field
from sqlmodel import Relationship

from .base import TimeStampedModel
from .category import Category
from .category import CategoryPublic
from .user import User
from .user import UserPublic


# Shared properties
class ResultBase(SQLModel):
    """ """

    score: int = Field(index=True)


# Properties to receive on result creation
class ResultCreate(ResultBase):
    """ """

    score: int
    category_id: int


# Properties to receive on result update
class ResultUpdate(ResultBase):
    """ """

    score: int | None = None  # type: ignore


# Database model, database table inferred from class name
class Result(ResultBase, TimeStampedModel, table=True):
    """ """

    id: int | None = Field(default=None, primary_key=True)
    score: int
    owner_id: int | None = Field(default=None,
                                 foreign_key="user.id",
                                 nullable=False)
    owner: User | None = Relationship(back_populates="results")
    category_id: int | None = Field(default=None,
                                    foreign_key="category.id",
                                    nullable=False)
    category: Category | None = Relationship(back_populates="results")

    def __str__(self) -> str:
        return f"{self.score}"


# Properties to return via API, id is always required
class ResultPublic(ResultBase, TimeStampedModel):
    """ """

    id: int
    owner_id: int
    owner: UserPublic
    category_id: int
    category: CategoryPublic
