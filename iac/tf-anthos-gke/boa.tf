module "boa-secret" {
  source = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"

  project_id              = data.google_project.project.project_id
  cluster_name            = module.gke.name
  cluster_location        = module.gke.location
  module_depends_on       = [module.gke]
  kubectl_create_command  = "kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/bank-of-anthos/${var.sync_branch}/extras/jwt/jwt-secret.yaml"
  kubectl_destroy_command = "kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/bank-of-anthos/${var.sync_branch}/extras/jwt/jwt-secret.yaml"
}

module "boa-istio" {
  source = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"

  project_id        = data.google_project.project.project_id
  cluster_name      = module.gke.name
  cluster_location  = module.gke.location
  module_depends_on = [module.asm.wait]

  kubectl_create_command  = "kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/bank-of-anthos/${var.sync_branch}/extras/istio/frontend-ingress.yaml"
  kubectl_destroy_command = "kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/bank-of-anthos/${var.sync_branch}/extras/istio/frontend-ingress.yaml"
}
