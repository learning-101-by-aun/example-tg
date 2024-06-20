locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.environment
}

terraform {
  source = "/Users/nuttanun/Documents/example-tg/terragrunt-module/topic-and-sub"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  topics = [
    {
      topic_name = "${local.env}-demo-topic-0000"
      topic_labels = {
        created_by = "terraform"
        group      = "customer"
      }
    },
    {
      topic_name = "${local.env}-demo-topic-0000.dlq"
      topic_labels = {
        created_by = "terraform"
        group      = "customer"
      }
      schema_settings = {
        schema   = "projects/cfw-customer-data-platform/schemas/customer_credit_sale"
        encoding = "JSON"
      }
    }
  ]

  subscription = [
    {
      name = "${local.env}-demo-subscription-0000-sub"
      topic = "dev-demo-topic-0000"
      ack_deadline_seconds = "60"
      labels = {
        created_by = "terraform"
        group      = "customer"
      }
      push_configs = {
        push_endpoint = "https://customer-process-szs3n5zqna-as.a.run.app/v1/customers/registration"
        oidc_token = {
          service_account_email = "cloudrun@cfw-customer-data-platform-dev.iam.gserviceaccount.com"
        }
      }
      dead_letter_policy = {
          dead_letter_topic = "projects/cfw-customer-data-platform-dev/topics/${local.env}-demo-topic-0000"
          max_delivery_attempts = "7"
        }
      retry_policy = {
        minimum_backoff = "300s"
        maximum_backoff = "300s"
      }
    },
    {
      name = "${local.env}-demo-subscription-0000.dlq-sub"
      topic = "dev-demo-topic-0000.dlq"
      ack_deadline_seconds = "60"
      labels = {
        created_by = "terraform"
        group      = "customer"
      }
    }
  ]
}
