output "private_subnets_rt_ids" { value = [aws_route_table.private-subnet.*.id] }
