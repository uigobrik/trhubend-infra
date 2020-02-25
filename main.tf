provider "google" {
    project = "${var.gcp_project}"
    region = "${var.region}"
}

resource "google_compute_network" "vpc_network" {
    name = "slack-notice"
    description = "VPC Network For Slack Notice Application"
}

resource "google_cloud_scheduler_job" "scheduler_job" {
    name = "slack_notice_github_trending"
    description = "Slack Notice For Github Trending"
    schedule = "0 6 * * *"
    time_zone = "Asia/Tokyo"
    attempt_deadline = "320s"

    http_target {
        http_method = "POST"
        uri         = "https://example.com/ping"
    }
}

resource "google_cloud_run_service" "cloud_run" {
    name = ""
    location = "us-central1"

    template {
        spec {
            containers {
                image = "gcr.io/"
            }
        }
    }

    traffic {
        percent = 100
        latest_revision = true
    }
}

