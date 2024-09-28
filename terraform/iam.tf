resource "google_storage_bucket_iam_member" "bucket_1" {
  bucket = google_storage_bucket.bucket_1.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_storage_bucket_iam_member" "bucket_2" {
  bucket = google_storage_bucket.bucket_2.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
