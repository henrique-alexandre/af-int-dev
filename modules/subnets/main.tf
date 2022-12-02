
resource "aws_subnet" "subnets" {
  // Create a subnet for each availability zone
  count = length(var.zones)

  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr, var.subnet_bits, count.index + (var.subnet_start * length(var.zones)))
  availability_zone = var.zones[count.index]
  tags = merge({
    Product          = var.product
    Name             = "${var.product}-${var.type}${var.set_count}-${var.purpose}-${var.env}-${var.zones[count.index]}"
    Service          = "Subnet"
    Tag              = lower("${var.product}-vpc")
    Environment      = var.env
    Network          = lower(var.type)
    immutable_data   = "{\"purpose\": \"${var.purpose}\"}"
    AvailabilityZone = element(var.zones, count.index)
  }, var.tags)
  #checkov:skip=CKV_AWS_130:We are purposefully chosing to assign public IPs, the default is not to in private and DB subnets
  #and we should consider not doing it by _default_ even in public subnets, making spinning up EC2 instances explicitly call out
  #the need for a public IP.
  map_public_ip_on_launch = var.public_ip
}

resource "aws_route_table" "subnet" {
  // Create a route table for each availability zone, if creating private subnets. Otherwise create a single table.
  count = var.type == "private" ? length(var.zones) : 1

  depends_on = [aws_subnet.subnets]
  vpc_id     = var.vpc_id

  tags = {
    Product = var.product
    // Include the Availability Zone in the name if it is a private subnet
    Name        = var.type == "private" ? "${var.product}-${var.type}${var.set_count}-${var.purpose}-${var.env}-${var.zones[count.index]}" : "${var.product}-${var.type}-${var.purpose}-${var.env}"
    Tag         = lower("${var.product}-vpc")
    Environment = var.env
    Service     = "Route Table"
  }
}

resource "aws_route" "route" {
    count                   = var.type == "private" ? length(var.zones) : 1
    route_table_id          = aws_route_table.subnet[count.index].id
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = var.type == "private" ? var.nat_gateway_by_az[var.zones[count.index]] : null
    gateway_id              = var.type == "public" ? var.igw : null
}

resource "aws_route_table_association" "subnet" {
  // Associate each route table created for each subnet
  count = length(var.zones)

  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = var.type == "private" ? element(aws_route_table.subnet.*.id, count.index) : aws_route_table.subnet[0].id
  depends_on     = [aws_subnet.subnets]
}
