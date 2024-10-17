provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### Single-service-account module call .
#####==============================================================================
module "service-account" {
  source = "./../../"
  name   = ["app"]

  roles = {
    "app" = "roles/viewer"
  }

  description = {
    "app" = "Single Account Description"
  }

  display_name = {
    "app" = "Single Service Account"
  }
}