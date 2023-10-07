GOLANG_CI_LINT_VER:=v1.54.2

include .env
export

up:
	docker compose build
	docker compose up --pull --build
.PHONY: start

up.dev:
	docker compose -f docker-compose.dev.yml up
.PHONY: up.dev

down:
	docker compose down
	docker compose -f docker-compose.dev.yml down
.PHONY: down

stop:
	docker compose stop
	docker compose -f docker-compose.dev.yml stop
.PHONY: stop

submodules:
	git submodule update --recursive --remote
.PHONY: submodules
