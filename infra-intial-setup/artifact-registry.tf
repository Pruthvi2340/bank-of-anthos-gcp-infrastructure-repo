resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
  disable_dependent_services=true
}

resource "google_project_service" "secretmanager" {
  project = var.project_id
  service = "secretmanager.googleapis.com"
  disable_dependent_services=true
}

resource "google_artifact_registry_repository" "gcp-docker-repo" {
  location      = var.location
  repository_id = var.name
  description   = "docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}

resource "google_artifact_registry_repository" "remote_dockerhub_store" {
  location      = var.location
  repository_id = "${var.name}-dockerhub"
  description   = "remote docker repository with credentials"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description = "docker hub with custom credentials"
    docker_repository {
      public_repository = "DOCKER_HUB"
    }
    upstream_credentials {
      username_password_credentials {
        username = "pruthvidevops"
        password_secret_version = google_secret_manager_secret_version.custom-remote-secret_version.name
      }
    }
  }
}

data "google_project" "project" {}

resource "google_secret_manager_secret" "custom-remote-secret" {
  depends_on = [ google_project_service.secretmanager ]
  secret_id = "dockerhub-password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "custom-remote-secret_version" {
  secret = google_secret_manager_secret.custom-remote-secret.id
  secret_data = var.dockerhub_password
}

resource "google_secret_manager_secret_iam_member" "secret-access" {
  secret_id = google_secret_manager_secret.custom-remote-secret.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-artifactregistry.iam.gserviceaccount.com"
}