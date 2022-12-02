## Description

This module creates a set of subnets and route tables based on the availability zones passed in.
A separate subnet will be created for each availability zone.

The "type" variable will alter the way the subnet and routes are created depending
on if the type value is "private" or "public".

A "public" type value will create a single route table to be used by all public subnets
and set the default 0.0.0.0/0 route to the Internet Gateway "igw" value.

A "private" type value will create a separate route table for each private subnet created
and set the default 0.0.0.0/0 route to the NAT Gateway ID for the appropriate availability zone
specified in the variable "nat_gateway_by_az". This ensures each private subnet is using a NAT gateway
running in its own availability zone.

The value of the "nat_gateway_by_az" variable should look like:
nat_gateway_by_az = {
  "us-east-1a" = "nat-02e67f46df0f"
  "us-east-1b" = "nat-09fada9317e6"
  "us-east-1c" = "nat-0faf504509e1"
}

When creating route tables you also have the option of specifying additional routes to be added. This could be useful
if setting up a VPN or VPC Peering. Details on the route can be found here:
https://www.terraform.io/docs/providers/aws/r/route_table.html
The format should be the following.
additional_routes = [{
  cidr_block     = "8.8.8.8/32"
  nat_gateway_id = "nat-0faf504509c01cee1"
}]

## Persistent EIPs

`persistent_eips` can be provided to the natgw module where an elastic ip address should endure VPC deletion/recreation.

If the number of EIPs provided is less than the number of availability zones requested for redundancy, new EIP(s) will be generated and allocated to meet the requirement. If more EIPs are provided than the number of azs, only the number required will be used and the rest will be dropped.
