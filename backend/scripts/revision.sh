set -x

docker compose exec gasyquiz alembic revision --autogenerate "$@"
