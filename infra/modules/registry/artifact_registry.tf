resource "google_artifact_registry_repository" "artifact_repository" {
  provider = google-beta

  location      = "eu-central1"
  repository_id = "${var.environment}-artifact-repo"
  description   = "Docker test repo"
  format        = "DOCKER"
}
