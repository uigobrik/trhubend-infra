resource "google_cloud_run_service" "cloud_run" {
    name = "slack-notice-server"
    location = "${var.region}"

    template {
        spec {
            containers {
                image = "gcr.io/cloudrun/hello"
            }
        }
    }

    traffic {
        percent = 100
        latest_revision = true
    }
}
