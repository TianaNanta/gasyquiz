from app.api.routes import category
from app.api.routes import items
from app.api.routes import login
from app.api.routes import question
from app.api.routes import response
from app.api.routes import result
from app.api.routes import users
from app.api.routes import utils
from fastapi import APIRouter

api_router = APIRouter()
api_router.include_router(login.router, tags=["login"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(utils.router, prefix="/utils", tags=["utils"])
api_router.include_router(category.router, prefix="/categories", tags=["categories"])
api_router.include_router(items.router, prefix="/items", tags=["items"])
api_router.include_router(question.router, prefix="/questions", tags=["questions"])
api_router.include_router(response.router, prefix="/responses", tags=["responses"])
api_router.include_router(result.router, prefix="/results", tags=["results"])
