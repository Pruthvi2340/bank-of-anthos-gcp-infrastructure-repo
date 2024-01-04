# create delivery pipeline for service including all targets
resource "google_clouddeploy_delivery_pipeline" "delivery-pipeline" {
  project  = var.project_id
  location = var.region
  name     = var.service
  serial_pipeline {
    dynamic "stages" {
      for_each = { for idx, target in var.targets : idx => target }
      content {
        profiles  = [stages.value.name]
        target_id = stages.value.name
        strategy {
          standard {
            verify = stages.value.name == "production" ? true : false
          }
        }
      }
    }
  }
  provider = google-beta
}
