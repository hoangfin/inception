# Inception

This project focuses on Docker and containerization. The goal is to set up a small infrastructure using Docker containers, including services:
- **NGINX** web server
- **WordPress and PHP-FPM** application
- **MariaDB** database

The infrastructure is defined using Docker Compose, making it easy to reproduce and deploy.

## Table of Contents
1. [Requirements](#requirements)
2. [Setup](#setup)
3. [Usage](#usage)
5. [Project Structure](#project-structure)
6. [Docker Images](#docker-images)
7. [Networking](#networking)
8. [Volumes](#volumes)
9. [Security](#security)
10. [Contributing](#contributing)

## Requirements
- Docker installed on your machine.
- Docker Compose installed.
- Basic knowledge of Docker and containerization.

## Setup
1. Clone this repository:
   ```bash
   git clone git@github.com:hoangfin/inception.git && cd inception
   ```

## Project Structure
```
inception/
|-- srcs/                    # Application source code (if applicable)
|   |-- requirements/
|   |   |-- mariadb/
|   |   |-- nginx/
|   |   |-- wordpress/
|   |-- .env                 # .env file exists here for educational purpose only
|   |-- docker-compose.yml
|-- Makefile
|-- README.md                # This file
```
