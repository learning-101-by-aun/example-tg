include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component. The envcommon configuration contains settings that are common
# for the component across all environments.
include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/topic.hcl"
  # We want to reference the variables from the included config in this configuration, so we expose it.
  expose = true
}

# Configure the version of the module to use in this environment. This allows you to promote new versions one
# environment at a time (e.g., qa -> stage -> prod).
terraform {
  source = "${include.envcommon.locals.base_source_url}?ref=1.1.2"
}

inputs = {
    topics = [
            {
                topic_name = "${include.envcommon.locals.env}-demo-topic-8888"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            },
            {
                topic_name = "${include.envcommon.locals.env}-demo-topic-8888.dlq"
                topic_labels = {
                    created_by = "terraform"
                    group      = "customer"
                }
            }
        ]
}
