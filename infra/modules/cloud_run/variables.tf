variable "region" {
  type        = string
  description = "GCP region from env variables"
}

variable "environment" {
  type        = string
  description = "Prod or test, get from CI/CD pipeline env variable, don't give it manually."
}
