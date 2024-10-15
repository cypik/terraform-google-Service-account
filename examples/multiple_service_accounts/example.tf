provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### Multiple-service-account module call .
#####==============================================================================
module "service-account" {
  source       = "./../../"
  names        = ["first", "second"]
  display_name = "Test Multiple Service Accounts"
  description  = "Test Multiple Service Accounts description"

  roles = [
    "roles/viewer",
    "roles/storage.objectViewer",
  ]
  generate_keys = true # Change to false to skip key generation
}