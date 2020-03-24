resource "google_compute_firewall" "allow_internal" {
    name = "allow-internal"
    network = "${google_compute_network.vpc_network.name}"
    allow {
        protocol = "tcp"
        ports = ["0-65535"]
    }
    allow {
        protocol = "udp"
        ports = ["0-65535"]
    }
    allow {
        protocol = "icmp"
    }
    source_ranges = ["${google_compute_subnetwork.vpc_subnetwork.ip_cidr_range}"]
}
