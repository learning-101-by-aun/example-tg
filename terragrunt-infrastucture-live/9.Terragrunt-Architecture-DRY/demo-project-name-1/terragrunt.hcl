locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  region      = local.env_vars.locals.region
  project     = local.env_vars.locals.project
  environment = local.env_vars.locals.environment

  backend_project = "cfr-tops-now-cloudops-nonprod"
  path_folder     = "cfr-tops-now-cloudops-nonprod"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.project}"
  region  = "${local.region}"
}
EOF
}

remote_state {
  backend = "gcs"
  config = {
    project  = "${local.backend_project}"
    location = "${local.region}"
    bucket   = "${local.backend_project}-terraform-state"
    prefix   = "terragrunt/${local.path_folder}/state/${path_relative_to_include()}"
  }
}

inputs = merge(
  local.env_vars.locals
)
