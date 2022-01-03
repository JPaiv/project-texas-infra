terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.5.0"
    }
  }
  backend "gcs" {
    bucket  = "tf-state-bucket-test-project-texas"
    prefix  = "terraform/state"
  }
}

# provider "google" {
#   version     = "4.5.0"
#   credentials = "${file(var.credentials)}"
#   project     = var.project_id
#   region      = var.regionte
# }

provider "google-beta" {
  version     = "4.5.0"
  credentials = "${file(var.credentials)}"
  project     = var.project_id
  region      = var.region
}

# module "vpc" {
#   source = ".modules/vpc"
#   region = var.region
#   project_id = var.project_id
#   environment = var.environment
# }

# module "gke" {
#   source = ".modules/gke"
#   region = var.region
#   project_id = var.project_id

#   depends_on = [module.vpc]
# }
resource "google_storage_bucket" "static-site" {
  name          = "image-store.com-test"
  location      = "EU"
  force_destroy = true
}
