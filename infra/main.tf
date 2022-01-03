terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket = "tf-state-bucket-test-project-texas"
    prefix = "terraform/state"
  }
}

module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  environment = var.environment
}

module "gke" {
  source      = "./modules/gke"
  region      = var.region
  project_id  = var.project_id
  environment = var.environment
  vpc_name    = module.vpc.vpc_id
  subnet_name = module.vpc.subnet_id
}

module "registry" {
  source          = "./modules/registry"
  region          = var.region
  project_id      = var.project_id
  service_account = var.service_account
}
