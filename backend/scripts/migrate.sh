set -x

docker compose exec gasyquiz alembic upgrade head
