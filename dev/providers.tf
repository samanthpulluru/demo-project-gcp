terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.16.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.45"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
  backend "remote" {
    organization = "samanthpulluru-demo-project"

    workspaces {
      name = "demo-project-dev"
    }
  }
  #   required_version = ">=0.13"
}
