# terraform-gcp-Service-account
# Terraform Google Cloud Service Account Module

## Introduction

This Terraform module creates a Google Cloud Service Account with configurable options. It is designed to be used in conjunction with other infrastructure modules.

## Usage

```hcl
module "service-account" {
  source                             = "git::https://github.com/opz0/terraform-google-service-account.git?ref=v1.0.0"
  name                               = "app"
  environment                        = "test"
  project_id                         = "opz0-397319"
  google_service_account_key_enabled = true
  key_algorithm                      = "KEY_ALG_RSA_2048"
  public_key_type                    = "TYPE_X509_PEM_FILE"
  private_key_type                   = "TYPE_GOOGLE_CREDENTIALS_FILE"
  members                            = []
}
```
Module Inputs
name: The name of the service account.
environment: The environment for the service account.
project_id: The Google Cloud project ID.
google_service_account_key_enabled: Enable Google service account key creation.
key_algorithm: The algorithm used for the key.
public_key_type: The type of public key file to generate.
private_key_type: The type of private key file to generate.
members: List of members to grant access to the service account.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/opz0/terraform-gcp-Service-account/blob/readme/LICENSE) file for more details.
