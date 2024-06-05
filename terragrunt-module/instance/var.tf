variable "project_id" {
  type        = string
  description = "Google project ID"
}

variable "region" {
  type        = string
  description = "region"
}

variable "zone" {
  type        = string
  description = "Zone"
}

variable "ip_name" {
  type        = string
  description = "IP Name"
}

variable "ip_version" {
  type        = string
  description = "IP Version"
}

variable "address_type" {
  type        = string
  description = "Address Type"
}

variable "instance_name" {
  type        = string
  description = "Instance Name"
}

variable "machine_type" {
  type        = string
  description = "Machine Type"
}

variable "tags" {
  type        = list(string)
  description = "Tags"
}

variable "image_name" {
  type        = string
  description = "Image Name"
}

variable "size" {
  type        = string
  description = "Disk Size"
}

variable "networks_name" {
  type        = string
  description = "Network Name"
}