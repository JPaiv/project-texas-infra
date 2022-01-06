resource "google_cloud_run_service" "primary" {
  name     = "${var.environment}-project-texas-cloud-run"
  location = var.region

  template {
    spec {
      containers {
        image = "eu.gcr.io/project-texas/flask-api"
        port {
          container_port = 5000
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
