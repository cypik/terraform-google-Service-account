provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### Multiple-service-account module call .
#####==============================================================================
module "service-account" {
  source = "./../../"

  name = ["svc-account-first", "svc-account-second"]

  display_name = {
    "svc-account-first"  = "Service Account One"
    "svc-account-second" = "Service Account Two"
  }

  description = {
    "svc-account-first"  = "Description for Account 1"
    "svc-account-second" = "Description for Account 2"
  }

  roles = {
    "svc-account-first"  = "roles/editor"
    "svc-account-second" = "roles/viewer"
  }

  generate_keys = true # Change to false to skip key generation
}