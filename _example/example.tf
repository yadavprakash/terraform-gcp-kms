provider "google" {
  project = "local-concord-408802"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}
#---------------------------------------(kms_key module)----------------------------------------
module "kms_key" {
  source           = ".././"
  name             = "dev1"
  environment      = "test"
  location         = "asia-northeast1"
  service_accounts = ["serviceAccount:985070905024-compute@developer.gserviceaccount.com"]
  role             = "roles/editor"
}
