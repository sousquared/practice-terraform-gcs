resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket_1" {
  name                        = "${random_id.bucket_prefix.hex}-bucket-1"
  project                     = var.project_id
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket" "bucket_2" {
  name                        = "${random_id.bucket_prefix.hex}-bucket-2"
  project                     = var.project_id
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket_object" "cat_image" {
  name         = "never-fetch/three-cats.jpg"
  source       = "images/three-cats.jpg"
  content_type = "image/jpeg"
  bucket       = google_storage_bucket.bucket_1.name
}

resource "google_storage_bucket_object" "dog_image" {
  name         = "love-to-fetch/two-dogs.jpg"
  source       = "images/two-dogs.jpg"
  content_type = "image/jpeg"
  bucket       = google_storage_bucket.bucket_2.name
}
