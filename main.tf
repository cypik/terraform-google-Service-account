module "labels" {
  source      = "cypik/labels/google"
  version     = "1.0.2"
  name        = var.name[0]
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
  extra_tags  = var.extra_tags
}

data "google_client_config" "current" {}

locals {
  account_billing = var.grant_billing_role && var.billing_account_id != ""
  org_billing     = var.grant_billing_role && var.billing_account_id == "" && var.org_id != ""

  xpn  = var.grant_xpn_roles && var.org_id != ""
  name = toset(var.name)

  name_role_pairs = [for name in local.name : {
    name = name
    role = var.roles[name]
  }]
}

#####==============================================================================
##### Allows management of a Google Cloud service account.
#####==============================================================================
resource "google_service_account" "service_accounts" {
  for_each = toset(var.name)

  account_id   = format("svc-%s", each.key)
  display_name = var.display_name[each.key]
  description  = var.description[each.key]
  project      = data.google_client_config.current.project
}

#####==============================================================================
##### When managing IAM roles, you can treat a service account either as a resource
##### or as an identity.
#####==============================================================================
resource "google_service_account_iam_binding" "admin_account_iam" {
  for_each = google_service_account.service_accounts

  service_account_id = format("projects/%s/serviceAccounts/%s", data.google_client_config.current.project, google_service_account.service_accounts[each.key].email)
  role               = var.roles[each.key]
  members            = [format("serviceAccount:%s", google_service_account.service_accounts[each.key].email)]
}

resource "google_project_iam_member" "project_roles" {
  for_each = { for pair in local.name_role_pairs : pair.name => pair if pair.role != "" }

  project = data.google_client_config.current.project
  role    = each.value.role
  member  = format("serviceAccount:%s", google_service_account.service_accounts[each.value.name].email)
}

resource "google_organization_iam_member" "billing_user" {
  for_each = local.org_billing ? local.name : toset([])

  org_id = var.org_id
  role   = "roles/billing.user"
  member = "serviceAccount:${google_service_account.service_accounts[each.value].email}"
}

resource "google_billing_account_iam_member" "billing_user" {
  for_each = local.account_billing ? local.name : toset([])

  billing_account_id = var.billing_account_id
  role               = "roles/billing.user"
  member             = "serviceAccount:${google_service_account.service_accounts[each.value].email}"
}

resource "google_organization_iam_member" "xpn_admin" {
  for_each = local.xpn ? local.name : toset([])

  org_id = var.org_id
  role   = "roles/compute.xpnAdmin"
  member = "serviceAccount:${google_service_account.service_accounts[each.value].email}"
}

resource "google_organization_iam_member" "organization_viewer" {
  for_each = local.xpn ? local.name : toset([])

  org_id = var.org_id
  role   = "roles/resourcemanager.organizationViewer"
  member = "serviceAccount:${google_service_account.service_accounts[each.value].email}"
}

#####==============================================================================
##### Creates and manages service account keys, which allow the use of a service
##### account with Google Cloud.
#####==============================================================================
resource "google_service_account_key" "mykey" {
  for_each = var.generate_keys ? local.name : toset([])

  service_account_id = google_service_account.service_accounts[each.key].email
  public_key_type    = var.public_key_type
  private_key_type   = var.private_key_type
  keepers            = var.keepers
  key_algorithm      = var.key_algorithm
}