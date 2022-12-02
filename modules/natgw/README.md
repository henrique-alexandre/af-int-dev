## Description

This module creates a NAT Gateway for each availability zone / subnet combination
in the subnets_by_az variable. The subnets_by_az variable value should look like this:

subnets_by_az = {
  "us-east-1a" = "subnet-0661b54669"
  "us-east-1b" = "subnet-0e3d50392a"
  "us-east-1c" = "subnet-03edbb8b50"
}

Using this AZ/subnet mapping format ensures each NAT gateway is created and tagged with the correct
availability zone it is assigned to.
*/