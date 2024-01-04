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

variable "sync_repo" {
  type        = string
  description = "Short version of repository to sync ACM configs from & use source for CI (e.g. 'bank-of-anthos' for https://www.github.com/GoogleCloudPlatform/bank-of-anthos)"
}

variable "repo_owner" {
  type        = string
  description = "Github username of the github repo owner whose fork shall be used for ACM, CloudBuild triggers (e.g. 'GoogleCloudPlatform' for https://www.github.com/GoogleCloudPlatform/bank-of-anthos)"
}

variable "sync_branch" {
  type        = string
  description = "Branch to sync ACM configs from & trigger CICD if pushed to."
}
