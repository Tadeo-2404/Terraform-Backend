# modules/aws/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  registry_auth {
    address = "index.docker.io"
    username = var.docker_username
    password = var.docker_password
  }
}

resource "docker_network" "app_network" {
  name = "app-network"
}

# PostgreSQL Container
resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "postgres" {
  name  = "postgres-db"
  image = docker_image.postgres.image_id
  env = [
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=${var.db_name}"
  ]
  ports {
    internal = 5432
    external = 5432
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Spring Boot post_service container
resource "docker_image" "post_service" {
  name = "${var.docker_username}/post-service:latest"
}

resource "docker_container" "post_service" {
  name  = "post_service"
  image = docker_image.post_service.image_id
  env = [
    "SPRING_DATASOURCE_URL=jdbc:postgresql://postgres-db:5432/${var.db_name}",
    "SPRING_DATASOURCE_USERNAME=${var.db_user}",
    "SPRING_DATASOURCE_PASSWORD=${var.db_password}",
    "SPRING_PROFILES_ACTIVE=prod"    
  ]
  depends_on = [docker_container.postgres]
  ports {
    internal = var.docker_port
    external = var.docker_port
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}
