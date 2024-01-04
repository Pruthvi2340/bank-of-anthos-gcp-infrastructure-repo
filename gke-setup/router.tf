resource "google_compute_router" "router" {
  name    = "nat-router"
  region  = var.region
  network = google_compute_network.main.id
}
