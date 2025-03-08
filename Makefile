NAME := inception

DOCKER_COMPOSE_YML := srcs/docker-compose.yml
DOCKER_VOL_MARIADB := mariadb_vol
DOCKER_VOL_WP := wp_vol

DATA_DIR := $(HOME)/data
DATA_DIR_MARIADB := $(DATA_DIR)/mariadb
DATA_DIR_WP := $(DATA_DIR)/wp

all: $(NAME)

$(NAME): $(DATA_DIR_MARIADB) $(DATA_DIR_WP)
	docker compose -p $(NAME) -f $(DOCKER_COMPOSE_YML) up --build

$(DATA_DIR_MARIADB):
	@mkdir -p $@

$(DATA_DIR_WP):
	@mkdir -p $@

down:
	docker compose -p $(NAME) -f $(DOCKER_COMPOSE_YML) down

clean:
	docker volume rm $(NAME)_$(DOCKER_VOL_MARIADB)
	docker volume rm $(NAME)_$(DOCKER_VOL_WP)
	rm -rf $(DATA_DIR)

fclean: clean

re: