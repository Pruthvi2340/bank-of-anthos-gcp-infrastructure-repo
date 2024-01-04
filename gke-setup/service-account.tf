resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

# cloud build service account
resource "google_service_account" "cloud_build" {
  project    = var.project_id
  account_id = "ci-production"
}

# additional roles for cloud-build service account
resource "google_artifact_registry_repository_iam_member" "cloud_build" {
  repository = var.container_registry.repository_id
  location   = var.container_registry.location
  project    = var.container_registry.project

  role   = "roles/artifactregistry.writer"
  member = "serviceAccount:${google_service_account.cloud_build.email}"

  provider = google-beta
}
