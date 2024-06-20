include "root" {
  path = find_in_parent_folders()
}
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/topic.hcl"
  expose = true
}
terraform {
  # source = "${include.envcommon.locals.base_source_url}?ref=1.1.2"
  source = "/Users/nuttanun/Documents/example-tg/terragrunt-module/topic"
}

# ${include.envcommon.locals.env}

# inputs = {
#     topics = [
#             {
#                 topic_name = "${include.envcommon.locals.env}-demo-topic-8888"
#                 topic_labels = {
#                     created_by = "terraform"
#                     group      = "customer"
#                 }
#             },
#             {
#                 topic_name = "${include.envcommon.locals.env}-demo-topic-8888.dlq"
#                 topic_labels = {
#                     created_by = "terraform"
#                     group      = "customer"
#                 }
#             }
#         ]
# }
