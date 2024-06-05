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