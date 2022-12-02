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
| cidr | IP CIDR Block to assign to the VPC | `string` | n/a | yes |
| env | Environment identifier | `string` | `"prod"` | no |
| flowlogs\_bucket | Bucket name in which to store VPC flowlogs | `any` | n/a | yes |
| log\_retention\_days | How long to keep logs for this service | `string` | `"7"` | no |
| name | Name to assign to the VPC | `string` | `"vpc"` | no |
| product | Product Name | `string` | n/a | yes |
| region | AWS Region | `string` | n/a | yes |
| traffic\_to\_store | What flow traffic should be written to the bucket | `any` | n/a | yes |
| zones | List of availability zones for the VPC to use | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| igw\_id | n/a |
| vpc\_cidr | n/a |
| vpc\_id | n/a |

<!--- END_TF_DOCS --->
