# explicit setup of VPC & subnets for GKE resources
resource "google_compute_router" "gke-nat-router" {
  project = var.project_id
  name    = "gke-nat-router"
  network = module.network.network_self_link
  region  = var.region
}

module "gke-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.gke-nat-router.name
  name                               = "gke-nat-config"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
