terraform {
  source = "https://github.com/learning-101-by-aun/example-tg.git//terragrunt-module/instance?ref=1.0.1"
  # source = "../../../../../terragrunt-module/instance"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    project_id = "cfr-tops-now-cloudops-nonprod"
    region     = "asia-southeast1"
    zone       = "asia-southeast1-b"

    ip_name      = "demo-dev-terragrunt-address-example-1"
    ip_version   = "IPV4"
    address_type = "EXTERNAL"

    instance_name = "demo-dev-terragrunt-instance-example-1"
    machine_type  = "e2-micro"
    tags          = ["http-server", "https-server"]
    image_name    = "ubuntu-2204-jammy-arm64-v20240519"
    size          = "10"
    networks_name = "default"

    scopes = ["cloud-platform"]
}
