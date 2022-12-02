variable "env" {
  description = "Environment identifier"
  default     = "prod"
  type        = string
}

variable "name" {
  description = "Name to include in the NAT Gateway"
  default     = "nat"
  type        = string
}

variable "subnets_by_az" {
  description = "Map of availability zones to subnet ids. Ex: {us-east-1a = subnet-0661b5466}"
  type        = map(string)
}

variable "persistent_eips" {
  description = "List of eips that will persist beyond vpc deletion which should be assigned to nat gateways"
  type        = list(string)
  default     = []
}

variable "eips_to_create" {
  type = string
  description = "number of EIPs we'll need to create"
}

variable "natgw_to_create" {
  type = string
  description = "describe your variable"
}
