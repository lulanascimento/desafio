
variable "path" { default = "./creds/service_account.json" }

provider "google" {
  project     = "perceptive-net-319104"
  region      = "europe-west2-a"
  credentials = file("./creds/service_account.json")
}

provider "google-beta" {
  project     = "perceptive-net-319104 "
  region      = "europe-west2-a"
  credentials = file("./creds/service_account.json")
}
