resource "google_service_account" "default" {
  account_id   = "demo-sa-ref-1"
  display_name = "Custom SA for VM Instance"
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
    service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = var.scopes
  }
}
