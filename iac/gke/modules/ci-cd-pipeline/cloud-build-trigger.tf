# CI trigger configuration
resource "google_cloudbuild_trigger" "ci" {
  name     = "${local.service_clean}-ci"
  project  = var.project_id
  location = var.region

  github {
    owner = var.repo_owner
    name  = var.repo_name

    push {
      branch = "^${var.repo_branch}$"
    }
  }
  included_files = ["src/${var.service}/**", "src/components/**"]
  filename       = "src/${local.team_name}/cloudbuild.yaml"
  substitutions = {
    _SERVICE               = "${local.service_name}"
    _TEAM                  = "${local.team_name}"
    _CACHE_URI             = "gs://${google_storage_bucket.build_cache.name}/${google_storage_bucket_object.cache.name}"
    _CONTAINER_REGISTRY    = "${var.container_registry.location}-docker.pkg.dev/${var.container_registry.project}/${var.container_registry.repository_id}"
    _SOURCE_STAGING_BUCKET = "gs://${google_storage_bucket.release_source_staging.name}"
    _CACHE                 = local.cache_filename
  }
  service_account = google_service_account.cloud_build.id
}
