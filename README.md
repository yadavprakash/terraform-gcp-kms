# Terraform-google-kms
# Terraform Google Cloud Template-kms Module
## Table of Contents

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Authors](#authors)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create kms .

## Usage

To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
## Example: kms

```hcl
module "kms_key" {
  source           = "https://github.com/yadavprakash/terraform-gcp-kms.git"
  name             = "dev"
  environment      = "test"
  location         = "asia-northeast1"
  service_accounts = ["serviceAccount:985070905024-compute@developer.gserviceaccount.com"]
  role             = "roles/editor"
}
```

This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs

- `name`: The name of the application or resource.
- `environment`: The environment in which the resource exists.
- `label_order`: The order in which labels should be applied.
- `business_unit`: The business unit associated with the application.
- `attributes`: Additional attributes to add to the labels.
- `extra_tags`: Extra tags to associate with the resource.

## Module Outputs
- This module currently does not provide any outputs.

# Examples
For detailed examples on how to use this module, please refer to the [example](https://github.com/yadavprakash/terraform-gcp-kms/tree/master/_example) directory within this repository.

## Authors
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/yadavprakash/terraform-gcp-kms/blob/master/LICENSE) file for details.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.75, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.75, < 5.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.75, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::git@github.com:yadavprakash/terraform-gcp-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key.key_ephemeral](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_member.crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_member) | resource |
| [google_kms_key_ring.key_ring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean flag to enable/disable service-account . | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_google_kms_crypto_key_enabled"></a> [google\_kms\_crypto\_key\_enabled](#input\_google\_kms\_crypto\_key\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_google_kms_crypto_key_iam_member_enabled"></a> [google\_kms\_crypto\_key\_iam\_member\_enabled](#input\_google\_kms\_crypto\_key\_iam\_member\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_google_kms_key_ring_enabled"></a> [google\_kms\_key\_ring\_enabled](#input\_google\_kms\_key\_ring\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | Generate a new key every time this period passes. | `string` | `"100000s"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location for the keyring. | `string` | `"asia"` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, yadavprakash | `string` | `"yadavprakash"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The immutable purpose of the CryptoKey. Possible values are ENCRYPT\_DECRYPT, ASYMMETRIC\_SIGN, and ASYMMETRIC\_DECRYPT. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_role"></a> [role](#input\_role) | this role use for permissions | `string` | `""` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | List of comma-separated owners for each key declared in set\_owners\_for. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_key"></a> [key](#output\_key) | n/a |
| <a name="output_keyring"></a> [keyring](#output\_keyring) | n/a |
| <a name="output_keyring_name"></a> [keyring\_name](#output\_keyring\_name) | n/a |
| <a name="output_keyring_resource"></a> [keyring\_resource](#output\_keyring\_resource) | n/a |
<!-- END_TF_DOCS -->