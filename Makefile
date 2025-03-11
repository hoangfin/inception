NAME := inception

DOCKER_COMPOSE_YML := srcs/docker-compose.yml
DOCKER_VOL_MARIADB := mariadb_vol
DOCKER_VOL_WP := wp_vol

DATA_DIR := $(HOME)/data
DATA_DIR_MARIADB := $(DATA_DIR)/mariadb
DATA_DIR_WP := $(DATA_DIR)/wp

all: $(NAME)

$(NAME): $(DATA_DIR_MARIADB) $(DATA_DIR_WP)
	@docker compose -p $(NAME) -f $(DOCKER_COMPOSE_YML) up --build

$(DATA_DIR_MARIADB):
	@mkdir -p $@

$(DATA_DIR_WP):
	@mkdir -p $@

up: $(NAME)

down:
	@docker compose -p $(NAME) -f $(DOCKER_COMPOSE_YML) down

clean:
	@docker compose -p $(NAME) down --rmi all -v

fclean: clean
	@sudo rm -rf $(DATA_DIR)

re: fclean $(NAME)

.PHONY: all up down clean fclean re
