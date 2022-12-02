output "nat_gateway_ids" {
  // Build a list of nat gateway ids
  value = aws_nat_gateway.natgw.*.id
}

output "nat_gateway_by_az" {
  // Build a map of availability zones to nat gateway ids.
  value = {
    for natgw in aws_nat_gateway.natgw.* :
    natgw.tags.AvailabilityZone => natgw.id
  }
}

output "public_elastic_ips" {
  // Build a list of public elastic ips
  value = concat(aws_eip.natgw.*.id,var.persistent_eips)
}
