resource "aws_vpc" "environment" {
  #checkov:skip=CKV2_AWS_1:All Subnets have NACL.. Jira logged to understand error (PSEC-377)
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Environment = var.env
    Service     = "VPC"
    Name        = var.name
  }
}

resource "aws_internet_gateway" "environment" {
  vpc_id = aws_vpc.environment.id
  tags = {
    Product     = var.product
    Environment = var.env
    Service     = "Internet Gateway"
    Name        = var.name
  }
}
