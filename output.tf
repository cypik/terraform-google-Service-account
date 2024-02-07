output "account_id" {
  value       = join("", google_service_account.service_account[*].id)
  description = "an identifier for the resource with format"
}

output "account_email" {
  value       = join("", google_service_account.service_account[*].email)
  description = "The e-mail address of the service account. "
}

output "account_name" {
  value       = join("", google_service_account.service_account[*].name)
  description = "The fully-qualified name of the service account."
}

output "account_unique_id" {
  value       = join("", google_service_account.service_account[*].unique_id)
  description = "The unique id of the service account. "
}

output "id" {
  value       = join("", google_service_account_iam_binding.admin-account-iam[*].id)
  description = "The iam  id of the service account."
}

output "key_id" {
  value       = join("", google_service_account_key.mykey[*].id)
  description = "An identifier for the  key_id resource with format"
}

output "key_name" {
  value       = join("", google_service_account_key.mykey[*].name)
  description = "The name used for this key pair"
}

output "public_key" {
  value       = join("", google_service_account_key.mykey[*].public_key)
  description = "The public key, base64 encoded"
}

output "private_key" {
  value       = join("", google_service_account_key.mykey[*].private_key)
  description = "The private key in JSON format, base64 encoded. This is what you normally get as a file when creating service account keys through the CLI or web console. This is only populated when creating a new key."
  sensitive   = true
}

output "valid_after" {
  value       = join("", google_service_account_key.mykey[*].valid_after)
  description = "The key can be used after this timestamp. A timestamp in RFC3339 UTC Zulu format, accurate to nanoseconds. "
}

output "valid_before" {
  value       = join("", google_service_account_key.mykey[*].valid_before)
  description = " The key can be used before this timestamp. A timestamp in RFC3339 UTC Zulu format, accurate to nanoseconds."
}

output "etag" {
  value       = join("", compact(google_service_account_iam_binding.admin-account-iam[*].etag))
  description = "The etag of the service account IAM policy."
}

output "roles" {
  value       = var.roles
  description = "The role that should be applied. "
}