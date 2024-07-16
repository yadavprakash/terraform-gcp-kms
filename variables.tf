variable "name" {
  type        = string
  default     = ""
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
  default     = "yadavprakash"
  description = "ManagedBy, yadavprakash"
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "google_kms_key_ring_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable service-account ."
}

variable "location" {
  type        = string
  default     = "asia"
  description = "Location for the keyring."
}

variable "google_kms_crypto_key_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "key_rotation_period" {
  type        = string
  default     = "100000s"
  description = "Generate a new key every time this period passes."
}

variable "purpose" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "The immutable purpose of the CryptoKey. Possible values are ENCRYPT_DECRYPT, ASYMMETRIC_SIGN, and ASYMMETRIC_DECRYPT."
}

variable "key_algorithm" {
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
  description = "The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs."
}

variable "key_protection_level" {
  type        = string
  default     = "SOFTWARE"
  description = "The protection level to use when creating a version based on this template. Default value: \"SOFTWARE\" Possible values: [\"SOFTWARE\", \"HSM\"]"
}

variable "google_kms_crypto_key_iam_member_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "role" {
  type        = string
  default     = ""
  description = "this role use for permissions"
}

variable "service_accounts" {
  type        = list(string)
  default     = []
  description = "List of comma-separated owners for each key declared in set_owners_for."
}
