variable "project_id" {
  type        = string
  description = "Project ID where the resources will be deployed"
}

variable "region" {
  type        = string
  description = "Region where regional resources will be deployed"
}

variable "container_registry" {
  type = object({
    location      = string
    project       = string
    repository_id = string
  })
  description = "Container registry object"
}

variable "repo_owner" {
  type        = string
  description = "Owner of the repo that contains source."
}

variable "repo_name" {
  type        = string
  description = "Name of the repo that contains source."
}

variable "service" {
  type        = string
  description = "Path of the service"
}

variable "targets" {
  type = list(object({
    name = string
  }))
  description = "Targets that shall be deployed to in order of deployment stages"
}

variable "repo_branch" {
  type        = string
  description = "Name of the branch that should trigger CICD when pushed to."
}

variable "cloud_deploy_sa" {
  type = object({
    id = string
    email = string
  })
  description = "Cloud Deploy Service Account"
}
