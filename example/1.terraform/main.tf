terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.31.1"
    }
  }
}
provider "google" {
  project = "cfr-tops-now-cloudops-nonprod"
  region  = "asia-southeast1"
}
# ------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ------------------------------------------------------------------------------
resource "google_compute_address" "default" {
  project      = "cfr-tops-now-cloudops-nonprod"
  name         = "demo-address-example-1"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
  region       = "asia-southeast1"
}
# ------------------------------------------------------------------------------
# CREATE A DEMO INSTANCE
# ------------------------------------------------------------------------------
resource "google_compute_instance" "default" {
  project      = "cfr-tops-now-cloudops-nonprod"
  name         = "demo-instance-example-1"
  machine_type = "e2-micro"
  zone         = "asia-southeast1-b"
  tags         = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-arm64-v20240519"
      size  = "10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.default.address
    }
  }
}
