resource "google_storage_bucket" "my_bucket" {
  name     = "${var.project_id}-owasp-scan-report"
  location = var.location
  force_destroy = true  
}