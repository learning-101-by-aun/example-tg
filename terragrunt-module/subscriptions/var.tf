variable "subscription" {
  type = list(object({
    name                 = string
    topic                = string
    ack_deadline_seconds = number
    labels               = map(string)
    push_config          = optional(any)
    dead_letter_policy = optional(object({
      dead_letter_topic     = string
      max_delivery_attempts = string
    }))
    retry_policy = optional(object({
      minimum_backoff = string
      maximum_backoff = string
    }))
  }))
  default = []
}
