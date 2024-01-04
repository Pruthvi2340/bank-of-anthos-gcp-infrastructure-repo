module "asm" {
  source                    = "terraform-google-modules/kubernetes-engine/google//modules/asm"
  version                   = "~> 29.0"
  project_id                = data.google_project.project.project_id
  cluster_name              = module.gke.name
  cluster_location          = module.gke.location
  enable_cni                = true
  enable_fleet_registration = false
  enable_mesh_feature       = true
}

module "istio-annotation" {
  source = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"

  project_id              = data.google_project.project.project_id
  cluster_name            = module.gke.name
  cluster_location        = module.gke.location
  module_depends_on       = [module.gke]
  kubectl_create_command  = "kubectl annotate --overwrite namespace default mesh.cloud.google.com/proxy='{\"managed\":\"true\"}'"
  kubectl_destroy_command = "kubectl annotate --overwrite namespace default mesh.cloud.google.com/proxy='{\"managed\":\"false\"}'"
}


module "istio-injection-label" {
  source = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"

  project_id              = data.google_project.project.project_id
  cluster_name            = module.gke.name
  cluster_location        = module.gke.location
  module_depends_on       = [module.gke]
  kubectl_create_command  = "kubectl label namespace default istio-injection=enabled istio.io/rev- --overwrite"
  kubectl_destroy_command = "kubectl label namespace default istio-injection-"
}
    
resource "time_sleep" "wait-for-istio-labels" {
  depends_on        = [module.istio-annotation, module.istio-injection-label]

  create_duration   = "30s"
}
