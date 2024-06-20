output "topic_id" {
  description = "Topic Name"
  value       = google_pubsub_topic.topics[*].id
}