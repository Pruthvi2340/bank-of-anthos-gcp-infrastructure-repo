project_id = ""
name = "bank-of-anthos"
zone = "us-central1-b"
region = "us-central1"
container_registry = {
  location = "us-central1"
  project  = data.google_project.project_id
  repository_id = "bank-of-anthos"
}
