variable "topics" {
  type = list(object({
    topic_name     = string
    topic_labels   = map(string)
    schema_settings = optional(object({
      schema   = string
      encoding = string
    }))
  }))
  default = []
}