module "acm" {
  source                   = "terraform-google-modules/kubernetes-engine/google//modules/acm"
  version                  = "~> 29.0"
  project_id               = data.google_project.project.project_id
  location                 = module.gke.location
  cluster_name             = module.gke.name

  sync_repo     = var.sync_repo
  sync_branch   = var.sync_branch
  sync_revision = var.sync_rev
  policy_dir    = var.policy_dir
  source_format = "unstructured"

  secret_type = "none"
    
  create_metrics_gcp_sa = false

  depends_on = [time_sleep.wait-for-istio-labels]
}
