provider "google" {
    project = "${var.gcp_project}"
    region = "${var.region}"
}

terraform {
    backend "gcs" {
        bucket = "test-be_yanagihara_taro"
        path = "terraform.tfstate"
    }
}

