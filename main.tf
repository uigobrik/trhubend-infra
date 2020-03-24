provider "google" {
    project = "${var.gcp_project}"
    region = "${var.region}"
}

terraform {
    backend "gcs" {
        bucket = ""
        path = "terraform.tfstate"
    }
}

