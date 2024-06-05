output "public_ip_address" {
  description = "Public IP Address"
  value       = google_compute_address.default.address
}
