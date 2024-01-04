locals {
  cache_filename = "cache"
  service_name   = reverse(split("/", var.service))[0]
  team_name      = split("/", var.service)[0]
  service_clean  = replace(var.service, "/", "-")
}

# used to get project number
data "google_project" "project" {
  project_id = var.project_id
}
