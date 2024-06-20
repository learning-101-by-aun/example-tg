locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the source URL in the child terragrunt configurations.
  base_source_url = "https://github.com/learning-101-by-aun/example-tg.git//terragrunt-module/public-ip"
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module. This defines the parameters that are common across all
# environments.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
    project_id = "cfr-tops-now-cloudops-nonprod"
    region     = "asia-southeast1"

    ip_name      = "demo-dev-terragrunt-address-example-1"
    ip_version   = "IPV4"
    address_type = "EXTERNAL"
}
