output "account_id" {
  value       = module.service-account.account_id
  description = "an identifier for the resource with format"
}

output "account_email" {
  value       = module.service-account.account_email
  description = "The e-mail address of the service account. "
}

output "account_name" {
  value       = module.service-account.account_name
  description = "The fully-qualified name of the service account."
}

output "account_unique_id" {
  value       = module.service-account.account_unique_id
  description = "The unique id of the service account. "
}

output "id" {
  value       = module.service-account.id
  description = "The iam  id of the service account."
}

output "key_id" {
  value       = module.service-account.key_id
  description = "An identifier for the  key_id resource with format"
}

output "key_name" {
  value       = module.service-account.key_name
  description = "The name used for this key pair"
}

output "public_key" {
  value       = module.service-account.public_key
  description = "The public key, base64 encoded"
}

output "private_key" {
  value       = module.service-account.private_key
  description = "The private key in JSON format, base64 encoded. This is what you normally get as a file when creating service account keys through the CLI or web console. This is only populated when creating a new key."
  sensitive   = true
}

output "valid_after" {
  value       = module.service-account.valid_after
  description = "The key can be used after this timestamp. A timestamp in RFC3339 UTC Zulu format, accurate to nanoseconds. "
}

output "valid_before" {
  value       = module.service-account.valid_before
  description = " The key can be used before this timestamp. A timestamp in RFC3339 UTC Zulu format, accurate to nanoseconds."
}
