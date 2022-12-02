variable "tag"   {}
variable "vpc_id" {}
variable "nat_gateway_ids" {
    type    = "list"
    default = []
}
variable "zones" {
    type    = "list"
    default = []
}
variable "subnet_ids" {
    type    = "list"
    default = []
}

variable "subnet_type" {
    type = "string"
    description = "Valid values: public, private"
}