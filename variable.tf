variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg 'Opz0'."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "google_service_account_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable service-account ."
}

variable "account_id" {
  type        = string
  default     = "service-account-id"
  description = "(Required) The account id that is used to generate the service account email address and a stable unique id."
}

variable "display_name" {
  type        = string
  default     = "Service Account"
  description = "(Optional) The display name for the service account. Can be updated without creating a new resource."
}

variable "description" {
  type        = string
  default     = ""
  description = " (Optional) A text description of the service account. "
}

variable "disabled" {
  type        = bool
  default     = false
  description = " (Optional) Whether a service account is disabled or not. Defaults to false."
}

variable "project_id" {
  type        = string
  default     = ""
  description = "(Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "google_service_account_key_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "public_key_type" {
  type        = string
  default     = "TYPE_X509_PEM_FILE"
  description = " (Optional) The output format of the public key requested. TYPE_X509_PEM_FILE is the default output format."
}

variable "private_key_type" {
  type        = string
  default     = "TYPE_GOOGLE_CREDENTIALS_FILE"
  description = "(Optional) The output format of the private key. TYPE_GOOGLE_CREDENTIALS_FILE is the default output format."
}

variable "key_algorithm" {
  type        = string
  default     = "KEY_ALG_RSA_2048"
  description = " (Optional) The algorithm used to generate the key. KEY_ALG_RSA_2048 is the default algorithm. "
}

variable "keepers" {
  type        = map(string)
  default     = null
  description = "Arbitrary map of values that, when changed, will trigger a new key to be generated."
}

variable "google_service_account_iam_binding_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "members" {
  type        = list(any)
  default     = []
  description = "Identities that will be granted the privilege in role."
}

variable "role" {
  type = list(string)
  default = ["roles/iam.serviceAccountUser"]
}