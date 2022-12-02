variable "product" {
  type        = string
  description = "The name of the product deployed into this account"
}

variable "env" {
  type        = string
  description = "The name of the environment in this account. (dev, test, prod)"
}

variable "region" {
  type        = string
  description = "The AWS region in which the resources will be deployed."
}

variable "zones" {
  type        = list(string)
  description = "A list of Availability Zones to use in the target region."
}

variable "cidr" {
  type        = string
  description = "The CIDR to use for the VPC."
}

variable "subnet_bits" {
  type        = string
  description = "The number of additional bits with which to extend the prefix. For example, if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20."
}

variable "flowlogs_bucket" {
  description = "Bucket ARN in which to store VPC flowlogs (VPC ID will be appended)"
  default     = "arn:aws:s3:::smart-sec-flowlogs"
}

variable "traffic_to_store" {
  description = "What flow traffic should be written to the bucket"
  default     = "ALL"
  validation {
    condition     = can(regex("ACCEPT|REJECT|ALL", var.traffic_to_store))
    error_message = "Must be one of ACCEPT,REJECT, ALL."
  }
}

variable "private_subnet_tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all private subnets."
}

variable "public_subnet_tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all public subnets."
}

variable "db_subnet_tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all db subnets."
}

variable "private_subnets_count" {
  description = "Number of private subnet sets to create"
  default     = 1
}

variable "public_subnets_count" {
  description = "Number of public subnet sets to create"
  default     = 1
}

variable "database_subnets_count" {
  description = "Number of database subnet sets to create"
  default     = 1
}

variable "persistent_eips" {
  description = "List of eips that will persist beyond vpc deletion which should be assigned to nat gateways"
  type        = list(string)
  default     = []
}
