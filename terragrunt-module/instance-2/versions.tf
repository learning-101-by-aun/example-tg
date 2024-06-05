terraform {
  required_version = ">= 0.12"

  backend "gcs" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.32"
    }
  }
}