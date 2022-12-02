variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "product" {
  default = ""
}

variable "cidr" {
  description = "IP CIDR block to create subnets from. Ex: 10.1.0.0/16"
  type        = string
}

variable "subnet_bits" {
  description = "How many bits to use for the subnets"
  default     = "4"
  type        = string
}

variable "subnet_start" {
  description = "Offset for starting the allocation of subnets"
  default     = "0"
  type        = string
}

variable "env" {
  description = "Environment identifier"
  default     = "prod"
  type        = string
}

variable "type" {
  description = "Either public or private. See the description at the top of this module for details"
  default     = "private"
  type        = string
}

variable "purpose" {
  description = "Subnet purpose, used for tagging."
  default     = "ec2-subnet"
  type        = string
}

variable "public_ip" {
  description = "Assign a public ip to instances in this subnet"
  default     = false
  type        = bool
}

variable "zones" {
  description = "List of availability zones to create subnets for"
  type        = list(string)
  default     = []
}

variable "igw" {
  description = "Internet gateway to use if creating public subnets"
  default     = null
}

variable "nat_gateway_by_az" {
  description = "A mapping of availability zones to nat gateways. See the description at the top of this module for details"
  type        = map(string)
  default     = null
}

variable "additional_routes" {
  description = "An optional set of additional routes to add to each route table. See the description at the top of this module for details"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "An optional map of tags to add to the subnets"
  type        = map(string)
  default     = {}
}

variable "set_count" {
  description = "An optional numberical identifier for what set of subnets this is"
  default     = null
}
