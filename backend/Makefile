build:
	@docker compose build

down:
	@docker compose down

fetch:
	@git fetch origin
	@git pull

run: build
	@docker compose up -d

run-prod: build
	@docker compose -f docker-compose.yml -d

watch: build
	@docker compose up
