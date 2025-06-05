terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

resource "google_storage_bucket" "demo_bucket" {
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = var.storage_class
  public_access_prevention    = var.public_access_prevention # Enforce public access prevention
  uniform_bucket_level_access = true                         # For Uniform access control

  # Hierarchical namespace configuration
  hierarchical_namespace {
    enabled = var.enable_hierarchical_namespace
  }

  force_destroy = false # Set to true to allow deletion of non-empty buckets

  # Example lifecycle rule (can be customized or removed)
  lifecycle_rule {
    condition {
      age = 30 # days
    }
    action {
      type = "Delete"
    }
  }

  versioning {
    enabled = true
  }

  labels = {
    environment = "demo"
    iac         = "terraform"
  }
}

resource "google_storage_bucket_object" "apac_transactions" {
  name   = "customer_transactions_apac.csv"
  bucket = google_storage_bucket.demo_bucket.name
  source = "${path.module}/../data/customer_transactions_apac.csv"
}