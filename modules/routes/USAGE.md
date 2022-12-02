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
| nat\_gateway\_ids | n/a | `list` | `[]` | no |
| subnet\_ids | n/a | `list` | `[]` | no |
| subnet\_type | Valid values: public, private | `string` | n/a | yes |
| tag | n/a | `any` | n/a | yes |
| vpc\_id | n/a | `any` | n/a | yes |
| zones | n/a | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_subnets\_rt\_ids | n/a |

<!--- END_TF_DOCS --->
