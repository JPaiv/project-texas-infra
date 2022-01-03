variable "environment" {
  type = string
  description = "Prod or test, get from CI/CD pipeline env variable, don't give it manually."
}

variable "region" {
  type = string
  description = "GCP region where cluster is to be deployed, has to be the same as with the VPC."
}

variable "ip_cidr_range" {
  type = string
  description = "CIDR range for the VPC subnet."
  default = "10.10.0.0/24"
}