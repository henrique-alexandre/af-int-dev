output "subnets_route_table_ids" {
  value = aws_route_table.subnet.*.id
}

output "subnet_ids" {
  value = aws_subnet.subnets.*.id
}

output "subnet_cidrs" {
  value = aws_subnet.subnets.*.cidr_block
}

output "subnets_by_az" {
  /* Build a list of availability zones to subnet ids. The result will look like:
   subnets_by_az = [
     "us-east-1a:subnet-0661b546699532bb7"
     "us-east-1b:subnet-0e3d50392ad54f953"
     "us-east-1c:subnet-03edbb8b508fcb100"
  ]
  We do this _instead of a map_ because TF can't use wildcards with maps,
  and this module gets called with a count
  */
  value = [
    for subnet in aws_subnet.subnets.* :
    "${subnet.tags.AvailabilityZone}:${subnet.id}"
  ]
}
