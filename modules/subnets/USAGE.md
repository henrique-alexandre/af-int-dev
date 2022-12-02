# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_routes | An optional set of additional routes to add to each route table. See the description at the top of this module for details | `list(map(string))` | `[]` | no |
| cidr | IP CIDR block to create subnets from. Ex: 10.1.0.0/16 | `string` | n/a | yes |
| env | Environment identifier | `string` | `"prod"` | no |
| igw | Internet gateway to use if creating public subnets | `any` | `null` | no |
| nat\_gateway\_by\_az | A mapping of availability zones to nat gateways. See the description at the top of this module for details | `map(string)` | `null` | no |
| product | n/a | `string` | `""` | no |
| public\_ip | Assign a public ip to instances in this subnet | `bool` | `false` | no |
| purpose | Subnet purpose, used for tagging. | `string` | `"ec2-subnet"` | no |
| region | AWS Region | `string` | n/a | yes |
| set\_count | An optional numberical identifier for what set of subnets this is | `any` | `null` | no |
| subnet\_bits | How many bits to use for the subnets | `string` | `"4"` | no |
| subnet\_start | Offset for starting the allocation of subnets | `string` | `"0"` | no |
| tags | An optional map of tags to add to the subnets | `map(string)` | `{}` | no |
| type | Either public or private. See the description at the top of this module for details | `string` | `"private"` | no |
| vpc\_id | VPC ID | `string` | n/a | yes |
| zones | List of availability zones to create subnets for | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_cidrs | n/a |
| subnet\_ids | n/a |
| subnets\_by\_az | n/a |
| subnets\_route\_table\_ids | n/a |

<!--- END_TF_DOCS --->
