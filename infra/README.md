# Terraform infrastrucsture #

Modules to deploy terraform infra. 

Local deployments are strongly discouraged: to avoid terraform state lock use CI/CD pipeline for apply stage.

## Purpose ##

Goal was to create reusable terraform modules for container infrastrucsture.

## GitOps ##

This repo was made with GitOps in mind. All operations should be done in the GitHub CI/CD pipeline.

This principle exists to ensure that there is only truth in the operations and that truth is in the CI/CD pipeline terraform remote state.