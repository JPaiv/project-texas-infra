terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket  = "tf-state-bucket-test-project-texas"
    prefix  = "terraform/state"
  }
}

# provider "google" {
#   credentials = "${file(var.credentials)}"
#   project     = var.project_id
#   region      = var.regionte
# }

# provider "google-beta" {
#   credentials = "${file(var.credentials)}"
#   project     = var.project_id
#   region      = var.region
# }

module "vpc" {
  source = ".modules/vpc"
  region = var.region
  project_id = var.project_id
  environment = var.environment
}

module "gke" {
  source = ".modules/gke"
  region = var.region
  project_id = var.project_id

  depends_on = [module.vpc]
}
