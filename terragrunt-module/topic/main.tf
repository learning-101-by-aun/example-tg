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