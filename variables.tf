variable "service_account_email" {
  type        = string
  description = "GCP Service account email"
}

variable "ssh_keys" {
  type        = string
  description = "Public SSH keys to add on creation"
}

