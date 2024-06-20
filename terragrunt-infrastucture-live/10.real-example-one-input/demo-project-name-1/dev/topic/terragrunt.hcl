include "root" {
  path = find_in_parent_folders()
}
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/non-prod/topics/non-prod-topic.hcl"
  expose = true
}
terraform {
  # source = "${include.envcommon.locals.base_source_url}?ref=1.1.2"
  source = "/Users/nuttanun/Documents/example-tg/terragrunt-module/topic"
}

# ${include.envcommon.locals.env}
