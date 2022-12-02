// Create an Elastic IP for each subnet/az
resource "aws_eip" "natgw" {
  // Calculate how many eips to create (minus manually provided). If too many eips provided, create 0
#  count = (length(var.subnets_by_az) - length(var.persistent_eips)) < 0 ? 0 : length(var.subnets_by_az) - length(var.persistent_eips)
  count = var.eips_to_create

  vpc   = true
}

resource "aws_nat_gateway" "natgw" {
  // Create a NAT Gateway for each subnet/az
  count = var.natgw_to_create

  // Using values() on var.subnets_by_az returns a list of subnet id strings
  subnet_id     = element(values(var.subnets_by_az), count.index)
  allocation_id = element(concat(aws_eip.natgw.*.id,var.persistent_eips), count.index)
  tags = {
    Environment = var.env
    Service     = "NAT Gateway"

    // Using keys() on var.subnets_by_az returns a list of AZ strings
    Name             = "${var.env}-${var.name}-${element(keys(var.subnets_by_az), count.index)}"
    AvailabilityZone = element(keys(var.subnets_by_az), count.index)
  }
}
