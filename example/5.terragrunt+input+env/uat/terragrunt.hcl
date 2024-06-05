inputs = {
    project_id = "cfr-tops-now-cloudops-nonprod"
    region     = "asia-southeast1"
    zone       = "asia-southeast1-b"

    ip_name      = "demo-address-example-1"
    ip_version   = "IPV4"
    address_type = "EXTERNAL"

    instance_name = "demo-instance-example-1"
    machine_type  = "e2-micro"
    tags          = ["http-server", "https-server"]
    image_name    = "ubuntu-2204-jammy-arm64-v20240519"
    size          = "10"
    networks_name = "default"
}