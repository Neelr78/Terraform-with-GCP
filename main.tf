terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.41.0"
    }
  }
}

provider "google" {
  project     = "fourth-eon-464116-u5"
  region      = "us-central1"
  credentials = "key.json"
}

provider "google-beta" {
  project     = "fourth-eon-464116-u5"
  region      = "us-central1"
  credentials = "key.json"
}