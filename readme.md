☁️ GCP Composer 3 Setup with Terraform

This repository contains Terraform code to set up a Google Cloud Composer 3 environment along with required Google Cloud services and a Cloud Storage bucket for scheduled snapshots.

📦 What This Project Does

Enables required GCP APIs for Composer

Creates a GCS bucket for Composer environment snapshots

Provisions a Composer 3 environment using a specified service account

Configures daily scheduled snapshots to a GCS path

📁 Project Structure

.
├── main.tf                # Composer environment, API services, and GCS bucket
└── README.md              # Documentation (this file)

🔧 Requirements

Terraform >= 1.3

Google Cloud SDK

Enabled billing on your GCP project

IAM service account with the following roles:

roles/editor

roles/composer.admin

roles/serviceusage.serviceUsageAdmin

roles/storage.admin

🛠️ Setup

1. Authenticate and Set Project

gcloud auth application-default login
gcloud config set project fourth-eon-464116-u5

2. Grant Permissions to the Service Account

# Replace with your actual service account email if different
SERVICE_ACCOUNT="gcp-with-terraform@fourth-eon-464116-u5.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding fourth-eon-464116-u5 \
  --member="serviceAccount:$SERVICE_ACCOUNT" \
  --role="roles/composer.admin"

gcloud projects add-iam-policy-binding fourth-eon-464116-u5 \
  --member="serviceAccount:$SERVICE_ACCOUNT" \
  --role="roles/serviceusage.serviceUsageAdmin"

gcloud projects add-iam-policy-binding fourth-eon-464116-u5 \
  --member="serviceAccount:$SERVICE_ACCOUNT" \
  --role="roles/storage.admin"

3. Initialize and Apply Terraform

terraform init
terraform apply

📌 Notes

Composer 3 uses the google-beta provider and supports scheduled_snapshots_config for automated Airflow snapshots.

Snapshots are stored in the my-composer-snapshots-890 bucket under /snapshots/.

Snapshots are created daily at 3 AM CST (UTC-06).

📂 Services Enabled

The following Google Cloud APIs will be enabled automatically:

composer.googleapis.com

cloudresourcemanager.googleapis.com

iam.googleapis.com

serviceusage.googleapis.com

storage.googleapis.com

sqladmin.googleapis.com

compute.googleapis.com

logging.googleapis.com

📂 Output

After deployment, you will have:

A Composer 3 environment named example-environment

A snapshot-enabled Cloud Storage bucket (my-composer-snapshots-890)

Scheduled DAG snapshots taken daily

📝 License

MIT License – feel free to use, modify, and share.

