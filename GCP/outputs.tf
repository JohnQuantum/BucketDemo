output "bucket_self_link" {
  description = "The self_link of the created GCS bucket."
  value       = google_storage_bucket.demo_bucket.self_link
}

output "bucket_url" {
  description = "The URL of the created GCS bucket."
  value       = google_storage_bucket.demo_bucket.url
}

output "bucket_name" {
  description = "The name of the created GCS bucket."
  value       = google_storage_bucket.demo_bucket.name
}