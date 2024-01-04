# GCS bucket used as skaffold build cache
resource "google_storage_bucket" "build_cache" {
  project                     = var.project_id
  name                        = "build-cache-${local.service_name}-${data.google_project.project.number}"
  uniform_bucket_level_access = true
  location                    = var.region
}

# GCS bucket used by Cloud Build to stage sources for Cloud Deploy
resource "google_storage_bucket" "release_source_staging" {
  project                     = var.project_id
  name                        = "release-source-staging-${local.service_name}-${data.google_project.project.number}"
  uniform_bucket_level_access = true
  location                    = var.region
}

# Initialize cache with empty file
resource "google_storage_bucket_object" "cache" {
  bucket  = google_storage_bucket.build_cache.name

  name    = local.cache_filename
  content = " "

  lifecycle {
    # do not reset cache when running terraform
    ignore_changes = [
      content,
      detect_md5hash
    ]
  }
}

# give CloudBuild SA access to skaffold cache
resource "google_storage_bucket_iam_member" "build_cache" {
  bucket  = google_storage_bucket.build_cache.name

  member = "serviceAccount:${google_service_account.cloud_build.email}"
  role   = "roles/storage.admin"
}

# give CloudBuild SA access to write to source staging bucket
resource "google_storage_bucket_iam_member" "release_source_staging_admin" {
  bucket  = google_storage_bucket.release_source_staging.name

  member = "serviceAccount:${google_service_account.cloud_build.email}"
  role   = "roles/storage.admin"
}

# give CloudDeploy SA access to read from source staging bucket
resource "google_storage_bucket_iam_member" "release_source_staging_objectViewer" {
  bucket  = google_storage_bucket.release_source_staging.name

  member = "serviceAccount:${var.cloud_deploy_sa.email}"
  role   = "roles/storage.objectViewer"
}
