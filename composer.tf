# Required GCP Services

resource "google_project_service" "composer" {
  project = "fourth-eon-464116-u5"
  service = "composer.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager" {
  project = "fourth-eon-464116-u5"
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "iam" {
  project = "fourth-eon-464116-u5"
  service = "iam.googleapis.com"
}

resource "google_project_service" "serviceusage" {
  project = "fourth-eon-464116-u5"
  service = "serviceusage.googleapis.com"
}

resource "google_project_service" "storage" {
  project = "fourth-eon-464116-u5"
  service = "storage.googleapis.com"
}

resource "google_project_service" "sqladmin" {
  project = "fourth-eon-464116-u5"
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "compute" {
  project = "fourth-eon-464116-u5"
  service = "compute.googleapis.com"
}

resource "google_project_service" "logging" {
  project = "fourth-eon-464116-u5"
  service = "logging.googleapis.com"
}


# GCS Bucket for Snapshots
resource "google_storage_bucket" "composer_snapshots" {
  name          = "my-composer-snapshots-890"  
  location      = "US"
  force_destroy = true
}

# Composer 3 Environment

resource "google_composer_environment" "example_environment" {
  provider = google-beta
  name     = "example-environment"

  config {
    node_config {
      service_account = "gcp-with-terraform@fourth-eon-464116-u5.iam.gserviceaccount.com"
    }

    software_config {
      image_version = "composer-3-airflow-2.10.5"
    }

    recovery_config {
      scheduled_snapshots_config {
        enabled                    = true
        snapshot_location          = "gs://${google_storage_bucket.composer_snapshots.name}/snapshots/"
        snapshot_creation_schedule = "0 3 * * *"  # Every day at 3 AM CST
        time_zone                  = "UTC-06"
      }
    }
  }
}
