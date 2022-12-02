# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr | The CIDR to use for the VPC. | `string` | n/a | yes |
| database\_subnets\_count | Number of database subnet sets to create | `number` | `1` | no |
| db\_subnet\_tags | A mapping of tags to assign to all db subnets. | `map(string)` | `{}` | no |
| env | The name of the environment in this account. (dev, test, prod) | `string` | n/a | yes |
| flowlogs\_bucket | Bucket ARN in which to store VPC flowlogs (VPC ID will be appended) | `string` | `"arn:aws:s3:::smart-sec-flowlogs"` | no |
| persistent\_eips | List of eips that will persist beyond vpc deletion which should be assigned to nat gateways | `list(string)` | `[]` | no |
| private\_subnet\_tags | A mapping of tags to assign to all private subnets. | `map(string)` | `{}` | no |
| private\_subnets\_count | Number of private subnet sets to create | `number` | `1` | no |
| product | The name of the product deployed into this account | `string` | n/a | yes |
| public\_subnet\_tags | A mapping of tags to assign to all public subnets. | `map(string)` | `{}` | no |
| public\_subnets\_count | Number of public subnet sets to create | `number` | `1` | no |
| region | The AWS region in which the resources will be deployed. | `string` | n/a | yes |
| subnet\_bits | The number of additional bits with which to extend the prefix. For example, if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20. | `string` | n/a | yes |
| traffic\_to\_store | What flow traffic should be written to the bucket | `string` | `"ALL"` | no |
| zones | A list of Availability Zones to use in the target region. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| database\_route\_table\_ids | n/a |
| nat\_gateway\_addresses | n/a |
| private\_route\_table\_ids | n/a |
| public\_route\_table\_id | n/a |
| vpc\_id | n/a |
| vpc\_private\_subnet\_ids | n/a |
| vpc\_public\_subnet\_ids | n/a |

<!--- END_TF_DOCS --->
