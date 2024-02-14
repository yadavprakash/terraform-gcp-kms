output "keyring" {
  value = join("", google_kms_key_ring.key_ring[*].id)
}

output "id" {
  value = join("", google_kms_key_ring.key_ring[*].id)
}

output "keyring_resource" {
  value = join("", google_kms_key_ring.key_ring[*].id)
}

output "keyring_name" {
  value = join("", google_kms_key_ring.key_ring[*].name)
}

output "key" {
  value = join("", google_kms_crypto_key.key[*].id)
}

