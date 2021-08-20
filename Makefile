DOCKER_COMPOSE=srcs/docker-compose.yml
COMMAND=docker-compose -f $(DOCKER_COMPOSE)

all:	up

up:
	$(COMMAND) up --build

down:
	$(COMMAND) down

.PHONY: all up down