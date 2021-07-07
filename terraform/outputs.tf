output "network" {
  value = google_compute_subnetwork.default.network
}

output "subnetwork_name" {
  value = google_compute_subnetwork.default.name
}

output "cluster_name" {
  value = google_container_cluster.default.name
}

output "cluster_region" {
  value = var.region
}

output "cluster_location" {
  value = google_container_cluster.default.location
}

output "cluster_endpoint" {
  value = google_container_cluster.default.endpoint

}

output "cluster_info" {
  value = data.google_container_cluster.default
}

output "cluster_node_config" {
  value = data.google_container_cluster.default.node_config
}

output "cluster_node_pool" {
  value = data.google_container_cluster.default.node_pool
}

//output "container_cluster_info" {
//  value = data.google_compute_instance_group.node_instance_groups
//}




 