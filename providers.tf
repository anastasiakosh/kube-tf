terraform {
  requirements_version = ">= 1.0.0"

  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.12.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.24.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
