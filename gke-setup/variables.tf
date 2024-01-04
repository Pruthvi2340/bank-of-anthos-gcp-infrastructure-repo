variable "project_id" {
  type        = string
  description = "Project ID where the resources will be deployed"
}

variable "region" {
  type        = string
  description = "Region where regional resources will be deployed (e.g. us-east1)"
}

variable "zone" {
  type        = string
  description = "Zone for the CloudSQL master instance (e.g. us-east1-b)"
}

variable "name" {
  
}

variable "container_registry" {
  type = object({
    location      = string
    project       = string
    repository_id = string
  })
  description = "Container registry object"

}
