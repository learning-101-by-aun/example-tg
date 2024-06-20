locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
}

terraform {
  source = "/Users/nuttanun/Documents/example-tg/terragrunt-module/topic"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    topics = [
            {
                topic_name = "${local.env}-demo-topic-6666"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
            {
                topic_name = "${local.env}-demo-topic-6666.dlq"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            }
        ]
}
