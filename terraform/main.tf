terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Rede Docker
resource "docker_network" "app_network" {
  name = "go-devops-network"
}

# Imagem Docker
resource "docker_image" "app_image" {
  name         = "go-devops-app:latest"
  keep_locally = true
}

# Container da aplicação
resource "docker_container" "app" {
  name  = "go-devops-app"
  image = docker_image.app_image.name

  ports {
    internal = 8080
    external = 8080
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  restart = "unless-stopped"
}
