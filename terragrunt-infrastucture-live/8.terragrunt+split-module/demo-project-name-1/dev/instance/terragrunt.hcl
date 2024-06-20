terraform {
  # source = "https://github.com/learning-101-by-aun/example-tg.git//terragrunt-module/instance?ref=1.0.1"
  source = "../../../../../terragrunt-module/instance-2"
}

include {
  path = find_in_parent_folders()
}

dependency "public_ip" {
  config_path = "../public-ip"
}

inputs = {
    project_id = "cfr-tops-now-cloudops-nonprod"
    region     = "asia-southeast1"
    zone       = "asia-southeast1-b"

    address      = dependency.public_ip.outputs.public_ip_address

    instance_name = "demo-dev-terragrunt-instance-example-1"
    machine_type  = "e2-micro"
    tags          = ["http-server", "https-server"]
    image_name    = "ubuntu-2204-jammy-arm64-v20240519"
    size          = "10"
    networks_name = "default"

    scopes = ["cloud-platform"]
}
