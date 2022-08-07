<!-- BEGIN_TF_DOCS -->
# terraform-aws-grafana-workload-account

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.permission_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amg_account_id"></a> [amg\_account\_id](#input\_amg\_account\_id) | Amazon Managed Grafana account id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | Name of the role |
<!-- END_TF_DOCS -->