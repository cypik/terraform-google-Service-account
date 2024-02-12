module "labels" {
  source      = "cypik/labels/google"
  version     = "1.0.1"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

data "google_client_config" "current" {
}

#####==============================================================================
##### Allows management of a Google Cloud service account.
#####==============================================================================
resource "google_service_account" "service_account" {
  count        = var.service_account_enabled && var.enabled ? 1 : 0
  account_id   = var.account_id
  display_name = format("%s-service-account", module.labels.id)
  description  = var.description
  disabled     = var.disabled
  project      = data.google_client_config.current.project

}

#####==============================================================================
##### Creates and manages service account keys, which allow the use of a service
##### account with Google Cloud.
#####==============================================================================
resource "google_service_account_key" "mykey" {
  count              = var.key_enabled && var.enabled ? 1 : 0
  service_account_id = join("", google_service_account.service_account[*].name)
  public_key_type    = var.public_key_type
  private_key_type   = var.private_key_type
  keepers            = var.keepers
  key_algorithm      = var.key_algorithm
}

#####==============================================================================
##### When managing IAM roles, you can treat a service account either as a resource
##### or as an identity.
#####==============================================================================
resource "google_service_account_iam_binding" "admin-account-iam" {
  count              = var.iam_binding_enabled && var.enabled ? 1 : 0
  service_account_id = join("", google_service_account.service_account[*].name)
  role               = var.roles[count.index]
  members = [
    "serviceAccount:${google_service_account.service_account[count.index].email}"
  ]
}
#####==============================================================================
##### Four different resources help you manage your IAM policy for a project.
#####==============================================================================
#tfsec:ignore:google-iam-no-project-level-service-account-impersonation
resource "google_project_iam_member" "default" {
  count   = var.iam_mamber_enabled && var.enabled ? 1 : 0
  project = data.google_client_config.current.project
  role    = var.roles[count.index]
  member  = format("serviceAccount:%s", join("", google_service_account.service_account[*].email))
}