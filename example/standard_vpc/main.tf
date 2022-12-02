provider "aws" {
  region = "eu-west-1"
}

data "aws_availability_zones" "azs" {
  state = "available"
}

module "my_stadard_vpc" {
  source = "../../"

  region      = "eu-west-1"
  product     = "terraform-testing"
  env         = "test"
  zones       = data.aws_availability_zones.azs.names
  cidr        = "172.16.0.0/16"
  subnet_bits = 8

}

## This just echos the module's outputs upwards for debugging and general proof of function

output "vpc_id" {
  value = module.my_stadard_vpc.vpc_id
}

output "vpc_private_subnet_ids" {
  value = module.my_stadard_vpc.vpc_private_subnet_ids
}

output "vpc_public_subnet_ids" {
  value = module.my_stadard_vpc.vpc_public_subnet_ids
}

output "public_route_table_id" {
  value = module.my_stadard_vpc.public_route_table_id
}

output "private_route_table_ids" {
  value = module.my_stadard_vpc.private_route_table_ids
}

output "database_route_table_ids" {
  value = module.my_stadard_vpc.database_route_table_ids
}

output "nat_gateway_addresses" {
  value = module.my_stadard_vpc.nat_gateway_addresses
}
