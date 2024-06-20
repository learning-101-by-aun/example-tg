terraform {
  # source = "https://github.com/learning-101-by-aun/example-tg.git//terragrunt-module/instance?ref=1.0.1"
  source = "../../../../../terragrunt-module/public-ip/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    project_id = "cfr-tops-now-cloudops-nonprod"
    region     = "asia-southeast1"

    ip_name      = "demo-dev-terragrunt-address-example-1"
    ip_version   = "IPV4"
    address_type = "EXTERNAL"
}
