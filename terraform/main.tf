
resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = var.network_name
  ip_cidr_range            = "10.0.0.0/24"
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

data "google_client_config" "current" {
}

data "google_container_engine_versions" "default" {
  location = var.location
}

resource "google_container_cluster" "default" {
  name               = var.network_name
  location           = var.location
  initial_node_count = 2
  min_master_version = data.google_container_engine_versions.default.latest_master_version
  network            = google_compute_subnetwork.default.name
  subnetwork         = google_compute_subnetwork.default.name

  enable_legacy_abac = true
  node_config {

    labels = {

    }
    tags = ["gke-terraform"]

    machine_type = "e2-small"
  }
  depends_on = [google_compute_network.default]

}

resource "google_compute_firewall" "default" {
  name    = "nodeapp-firewall"
  network = google_compute_network.default.name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["31785"]
  }

  target_tags = ["gke-terraform"]
}



data "google_container_cluster" "default" {
  name     = var.network_name
  location = var.location
}



// GKE node instance group details
//data "google_compute_instance_group" "node_instance_groups" {
//    for_each = toset(data.google_container_cluster.default.node_pool[0].instance_group_urls)
//   self_link = replace(each.key, "instanceGroupManagers", "instanceGroups")
//}