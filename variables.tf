variable "domain" {
  type        = string
  description = "Domain name"
}

variable "endpoint" {
  type        = string
  description = "Prefix of endpoint name"
}

variable "record" {
  type        = any
  description = "Endpoint record"
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign."
  type        = map(string)
  default     = {}
}