output "example_ip_address" {
  value       = google_compute_global_address.default.address
  description = "グローバルIPアドレスの値"
}

output "bucket_1_url" {
  value       = google_storage_bucket.bucket_1.url
  description = "バケット1のURL"
}

output "bucket_2_url" {
  value       = google_storage_bucket.bucket_2.url
  description = "バケット2のURL"
}
