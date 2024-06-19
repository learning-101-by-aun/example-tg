output "topic_name" {
  description = "Topic Name"
  value       = google_pubsub_topic.topics[*].name
}