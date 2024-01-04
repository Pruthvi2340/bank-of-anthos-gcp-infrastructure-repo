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

provider "google" {
  project     = var.project_id
  region      = var.location
}