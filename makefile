GOLANG_CI_LINT_VER:=v1.54.2

include .env
export

up:
	docker compose build
	docker compose up --pull --build
.PHONY: start

down:
	docker compose down
.PHONY: down

stop:
	docker compose stop
.PHONY: stop

submodules:
	git submodule update --recursive --remote
.PHONY: submodules
