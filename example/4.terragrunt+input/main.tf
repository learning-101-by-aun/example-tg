terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.31.1"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}
# ------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ------------------------------------------------------------------------------
resource "google_compute_address" "default" {
  project      = var.project_id
  name         = var.ip_name
  ip_version   = var.ip_version
  address_type = var.address_type
  region       = var.region
}
# ------------------------------------------------------------------------------
# CREATE A DEMO INSTANCE
# ------------------------------------------------------------------------------
resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.image_name
      size  = var.size
    }
  }

  network_interface {
    network = var.networks_name
    access_config {
      nat_ip = google_compute_address.default.address
    }
  }
}
