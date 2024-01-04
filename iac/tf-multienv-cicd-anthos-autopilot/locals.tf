locals {
  services         = ["frontend", "accounts/contacts", "accounts/userservice", "ledger/balancereader", "ledger/ledgerwriter", "ledger/transactionhistory"] # List of service paths as string
  application_name = "bank-of-anthos"                                                                                                                      # used for naming of resources
  cluster_names    = toset(["development", "staging", "production"])                                                                                       # used to create network configuration below
  network_name     = "shared-gke"                                                                                                                          # VPC containing resources will be given this name
  network = { for name in local.cluster_names : name =>
    {
      subnetwork              = "${name}-gke-subnet"
      master_auth_subnet_name = "${name}-gke-master-auth-subnet"
      ip_range_pods           = "${name}-ip-range-pods"
      ip_range_services       = "${name}-ip-range-svc"
  } }
  sync_repo_url    = "https://www.github.com/${var.repo_owner}/${var.sync_repo}"                      # repository containing source
  cloud_build_sas  = [for service in local.services : module.ci-cd-pipeline[service].cloud_build_sa]  # cloud build service accounts used for CI
  cache_filename   = "cache"
}
