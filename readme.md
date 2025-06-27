# Google Cloud Composer Environment with Terraform

This Terraform configuration sets up a **Google Cloud Composer 3** environment on GCP. It includes the necessary service API activations, a GCS bucket for snapshot storage, and scheduled snapshot configuration.

## 📁 Project Overview

This setup includes:

- Enabling required GCP APIs (Composer, IAM, Storage, etc.)
- Creating a Cloud Storage bucket for Airflow environment snapshots
- Deploying a Cloud Composer v3 environment with scheduled snapshot recovery

## ⚙️ Requirements

- Terraform >= 1.0
- GCP Project with billing enabled
- A service account with appropriate permissions (see below)

## 🔑 IAM Permissions

Ensure the service account used in the Composer environment has the following roles:

- Composer Admin
- Storage Admin
- Service Usage Admin
- Cloud SQL Admin
- Compute Viewer
- Logging Admin

Service account:
\`gcp-with-terraform@fourth-eon-464116-u5.iam.gserviceaccount.com\`

## 🧱 Terraform Resources

### Enabled Services
- composer.googleapis.com
- cloudresourcemanager.googleapis.com
- iam.googleapis.com
- serviceusage.googleapis.com
- storage.googleapis.com
- sqladmin.googleapis.com
- compute.googleapis.com
- logging.googleapis.com

### Composer GCS Bucket
Creates a bucket for Composer snapshots:
- Name: \`my-composer-snapshots-890\`
- Location: \`US\`
- Force Destroy: Enabled

### Composer Environment
- Name: \`example-environment\`
- Image: \`composer-3-airflow-2.10.5\`
- Snapshots: Daily at 3 AM CST
- Snapshot storage path: \`gs://my-composer-snapshots-890/snapshots/\`

## 🚀 Deployment Steps

1. Authenticate with GCP:

```bash
gcloud auth application-default login
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the configuration:

```bash
terraform apply
```

## 📎 Notes

- Ensure the GCP project ID is correct in all resources.
- Make sure the service account has enough permissions to manage services and create Composer environments.
- The snapshot time zone is set to \`UTC-06\` (Central Time).

EOF
