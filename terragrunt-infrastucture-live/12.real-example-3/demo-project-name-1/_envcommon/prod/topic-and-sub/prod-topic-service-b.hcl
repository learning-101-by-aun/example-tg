locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment

  # base_source_url = "https://github.com/learning-101-by-aun/example-tg.git//terragrunt-module/public-ip"
}

inputs = {
    topics = [
            {
                topic_name = "${local.env}-demo-topic-5555"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
            {
                topic_name = "${local.env}-demo-topic-5555.dlq"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
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
            },
            {
                topic_name = "${local.env}-demo-topic-7777"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
            {
                topic_name = "${local.env}-demo-topic-7777.dlq"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },            {
                topic_name = "${local.env}-demo-topic-8888"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
            {
                topic_name = "${local.env}-demo-topic-8888.dlq"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            }
        ]
}
