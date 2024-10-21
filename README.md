# Terraform-google-service-account
# Terraform Google Cloud Service Account Module


## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Author](#author)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction

This Terraform module creates a Google Cloud Service Account with configurable options. It is designed to be used in conjunction with other infrastructure modules.

## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
## Examples:

## Examples: single-service-account

```hcl
module "service-account" {
  source          = "cypik/service-account/google"
  version         = "1.0.3"
  service_account = [
    {
      name          = "test"
      display_name  = "Single Service Account"
      description   = "Single Account Description"
      roles         = ["roles/viewer"] # Single role
      generate_keys = false
    }

  ]
}
```

## Examples: service-account
```hcl
module "service-account" {
  source          = "cypik/service-account/google"
  version         = "1.0.3"
  service_account = [
    {
      name          = "svc-account-first"
      display_name  = "First Service Account"
      description   = "This is the first service account"
      roles         = ["roles/editor", "roles/viewer", "roles/owner"] # Multiple roles
      generate_keys = true
    },
    {
      name          = "svc-account-second"
      display_name  = "Second Service Account"
      description   = "This is the second service account"
      roles         = ["roles/editor"] # Single role
      generate_keys = true
    }
  ]
}

```
This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/cypik/terraform-google-service-account/tree/master/examples) directory within this repository.

## Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
## License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/cypik/terraform-google-service-account/blob/master/LICENSE) file for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=6.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >=6.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/google | 1.0.2 |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.billing_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_organization_iam_member.billing_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.organization_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.xpn_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.project_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_binding.admin_account_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [google_service_account_key.mykey](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | If assigning billing role, specificy a billing account (default is to assign at the organizational level). | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags for the resource. | `map(string)` | `{}` | no |
| <a name="input_grant_billing_role"></a> [grant\_billing\_role](#input\_grant\_billing\_role) | Grant billing user role. | `bool` | `false` | no |
| <a name="input_grant_xpn_roles"></a> [grant\_xpn\_roles](#input\_grant\_xpn\_roles) | Grant roles for shared VPC management. | `bool` | `true` | no |
| <a name="input_keepers"></a> [keepers](#input\_keepers) | Arbitrary map of values that, when changed, will trigger a new key to be generated. | `map(string)` | `null` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | (Optional) The algorithm used to generate the key. KEY\_ALG\_RSA\_2048 is the default algorithm. | `string` | `"KEY_ALG_RSA_2048"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, e.g. 'info@cypik.com'. | `string` | `"info@cypik.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Id of the organization for org-level roles. | `string` | `""` | no |
| <a name="input_private_key_type"></a> [private\_key\_type](#input\_private\_key\_type) | (Optional) The output format of the private key. TYPE\_GOOGLE\_CREDENTIALS\_FILE is the default output format. | `string` | `"TYPE_GOOGLE_CREDENTIALS_FILE"` | no |
| <a name="input_public_key_type"></a> [public\_key\_type](#input\_public\_key\_type) | (Optional) The output format of the public key requested. TYPE\_X509\_PEM\_FILE is the default output format. | `string` | `"TYPE_X509_PEM_FILE"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-google-service-account"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | A list of service accounts with their attributes, including name, display\_name, description, roles, and generate\_keys. | <pre>list(object({<br>    name          = string<br>    display_name  = string<br>    description   = string<br>    roles         = list(string)<br>    generate_keys = bool<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_display_name"></a> [account\_display\_name](#output\_account\_display\_name) | The display name of the service account. |
| <a name="output_account_email"></a> [account\_email](#output\_account\_email) | The e-mail address of the service account. |
| <a name="output_account_unique_id"></a> [account\_unique\_id](#output\_account\_unique\_id) | The unique id of the service account. |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | An identifier for the key\_id resource. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | The private key in JSON format, base64 encoded. |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | The public key, base64 encoded. |
| <a name="output_valid_after"></a> [valid\_after](#output\_valid\_after) | The key can be used after this timestamp. |
| <a name="output_valid_before"></a> [valid\_before](#output\_valid\_before) | The key can be used before this timestamp. |
<!-- END_TF_DOCS -->