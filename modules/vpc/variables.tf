variable "product" {
  description = "Product Name"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "cidr" {
  description = "IP CIDR Block to assign to the VPC"
  type        = string
}

variable "zones" {
  description = "List of availability zones for the VPC to use"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name to assign to the VPC"
  default     = "vpc"
  type        = string
}

variable "env" {
  description = "Environment identifier"
  default     = "prod"
  type        = string
}

variable "log_retention_days" {
  description = "How long to keep logs for this service"
  type        = string
  default     = "7"
}

variable "flowlogs_bucket" {
  description = "Bucket name in which to store VPC flowlogs"
}

variable "traffic_to_store" {
  description = "What flow traffic should be written to the bucket"
}