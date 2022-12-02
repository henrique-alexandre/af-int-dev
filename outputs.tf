output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_private_subnet_ids" {
  value = module.private-subnets.*.subnet_ids
}

output "vpc_public_subnet_ids" {
  value = module.public-subnets.*.subnet_ids
}

output "public_route_table_id" {
  value = module.public-subnets.*.subnets_route_table_ids[0]
}

output "private_route_table_ids" {
  value = module.private-subnets.*.subnets_route_table_ids
}

output "database_route_table_ids" {
  value = module.db-subnets.*.subnets_route_table_ids
}

output "nat_gateway_addresses" {
  value = module.nat.public_elastic_ips
}
