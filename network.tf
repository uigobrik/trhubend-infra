resource "google_compute_network" "vpc_network" {
    name = "slack-notice-network"
    description = "VPC Network For Slack Notice Application"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
    name = "slack-notice-subnetwork"
    ip_cidr_range = "192.168.0.0/24"
    network = "${google_compute_network.vpc_network.name}"
    description = "vpc_network.vpc_subnetwork"
    region = "${var.region}"
}
