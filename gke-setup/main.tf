terraform {
  backend "gcs" {
    bucket = "bank-of-anthos-tf-state"
    prefix = "bank-of-anthos"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

# google-beta provider for fleet API, artifact registry
provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# default google provider for most resources
provider "google" {
  project = var.project_id
  region  = var.region
}

# used to get project number
data "google_project" "project" {
  project_id = var.project_id
}

# data needed for kubernetes provider
data "google_client_config" "default" {}
