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
| eips\_to\_create | number of EIPs we'll need to create | `string` | n/a | yes |
| env | Environment identifier | `string` | `"prod"` | no |
| name | Name to include in the NAT Gateway | `string` | `"nat"` | no |
| natgw\_to\_create | describe your variable | `string` | n/a | yes |
| persistent\_eips | List of eips that will persist beyond vpc deletion which should be assigned to nat gateways | `list(string)` | `[]` | no |
| subnets\_by\_az | Map of availability zones to subnet ids. Ex: {us-east-1a = subnet-0661b5466} | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_by\_az | n/a |
| nat\_gateway\_ids | n/a |
| public\_elastic\_ips | n/a |

<!--- END_TF_DOCS --->
