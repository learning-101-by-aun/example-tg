resource "google_pubsub_topic" "topics" {
  count  = length(var.topics)
  name   = var.topics[count.index].topic_name
  labels = var.topics[count.index].topic_labels

  dynamic "schema_settings" {
    for_each = try(var.topics[count.index].schema_settings, null) == null ? [] : [1]
    content {
      schema   = lookup(var.topics[count.index].schema_settings, "schema", null)
      encoding = lookup(var.topics[count.index].schema_settings, "encoding", null)
    }
  }
}

resource "google_pubsub_subscription" "subscriptions" {
  count      = length(var.subscription)
  depends_on = [google_pubsub_topic.topics]

  name                 = var.subscription[count.index].name
  topic                = var.subscription[count.index].topic
  ack_deadline_seconds = var.subscription[count.index].ack_deadline_seconds
  labels               = var.subscription[count.index].labels

  dynamic "push_config" {
    for_each = try(var.subscription[count.index].push_config, null) == null ? [] : [1]

    content {
      push_endpoint = lookup(var.subscription[count.index].push_configs, "push_endpoint", null)
      dynamic "oidc_token" {
        for_each = try(var.subscription[count.index].push_config.oidc_token, null) == null ? [] : [1]

        content {
          service_account_email = lookup(var.subscription[count.index].push_config.oidc_token.service_account_email, "service_account_email", null)
        }
      }
    }
  }

  dynamic "dead_letter_policy" {
    for_each = try(var.subscription[count.index].dead_letter_policy, null) == null ? [] : [1]

    content {
      dead_letter_topic     = lookup(var.subscription[count.index].dead_letter_policy, "dead_letter_topic", null)
      max_delivery_attempts = lookup(var.subscription[count.index].dead_letter_policy, "max_delivery_attempts", null)
    }
  }

  dynamic "retry_policy" {
    for_each = try(var.subscription[count.index].retry_policy, null) == null ? [] : [1]

    content {
      minimum_backoff = lookup(var.subscription[count.index].retry_policy, "minimum_backoff", null)
      maximum_backoff = lookup(var.subscription[count.index].retry_policy, "maximum_backoff", null)
    }
  }
}
