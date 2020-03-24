resource "google_cloud_scheduler_job" "scheduler_job" {
    name = "slack-notice-schedule"
    description = "Slack Notice Schedule"
    schedule = "0 6 * * *"
    time_zone = "Asia/Tokyo"
    attempt_deadline = "320s"

    http_target {
        http_method = "POST"
        uri         = "https://example.com/ping"
    }
}
