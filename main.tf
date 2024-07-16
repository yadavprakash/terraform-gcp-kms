module "labels" {
  source      = "git::git@github.com:yadavprakash/terraform-gcp-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

#==================(A KeyRing is a toplevel logical grouping of CryptoKeys.)=====================
resource "google_kms_key_ring" "key_ring" {
  count    = var.google_kms_key_ring_enabled && var.enabled ? 1 : 0
  name     = format("%s-ring", module.labels.id)
  location = var.location
}

#================(A CryptoKey represents logical key that can be used for cryptographic operations.)===============
resource "google_kms_crypto_key" "key" {
  count           = var.google_kms_crypto_key_enabled && var.enabled ? 1 : 0
  name            = format("%s-keyjj", module.labels.id)
  key_ring        = join("", google_kms_key_ring.key_ring[*].id)
  rotation_period = var.key_rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }

  version_template {
    algorithm        = var.key_algorithm
    protection_level = var.key_protection_level
  }
}

#============(A CryptoKey represents logical key that can be used for cryptographic operations.)============
resource "google_kms_crypto_key" "key_ephemeral" {
  count           = var.google_kms_crypto_key_enabled && var.enabled ? 1 : 0
  name            = format("%s-key", module.labels.id)
  key_ring        = join("", google_kms_key_ring.key_ring[*].id)
  rotation_period = var.key_rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }

  version_template {
    algorithm        = var.key_algorithm
    protection_level = var.key_protection_level
  }
}

#==========(Three different resources help you manage your IAM policy for KMS crypto key.)=============
resource "google_kms_crypto_key_iam_member" "crypto_key" {
  count         = var.google_kms_crypto_key_iam_member_enabled && var.enabled ? 1 : 0
  crypto_key_id = join("", google_kms_crypto_key.key[*].id)
  role          = var.role
  member        = compact(split(",", var.service_accounts[count.index]))[0]
}


