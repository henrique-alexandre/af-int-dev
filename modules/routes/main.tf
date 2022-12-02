resource "aws_route_table" "route-subnet" {
    count  = length(var.zones)
    vpc_id = var.vpc_id
    tags = {
        Name        = "${var.tag}-private-subnet-route-table"
        Environment = lower(var.tag)
    }
}

resource "aws_route" "route" {
    count                   = length(var.zones)
    route_table_id          = aws_route_table.route-subnet.id
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = element(var.nat_gateway_ids, count.index)
}

resource "aws_route_table_association" "route-subnet" {
    count          = length(var.zones)
    subnet_id      = element(var.subnet_ids, count.index)
    route_table_id = element(aws_route_table.route-subnet.*.id, count.index)
}
