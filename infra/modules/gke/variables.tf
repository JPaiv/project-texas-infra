variable "environment" {
  type = string
  description = "Prod or test, get from CI/CD pipeline env variable, don't give it manually."
}

variable "vpc_name" {
  type = string
  description = "VPC name of the subnet where GKE cluster is to be deployed."
}

variable "subnet_name" {
  type = string
  description = "Subnet of the VPC where GKE cluster is to be desployed."
}

variable "region" {
  type = string
  description = "GCP region where cluster is to be deployed, has to be the same as with the VPC."
}

variable "gke_num_nodes" {
  type = number
  description = "Number of default nodes on GKE cluster."
  default = 1
}

variable "project_id" {
  type = string
  description = "Project id for GCP, get from CI/CD given environmen variables."
}
