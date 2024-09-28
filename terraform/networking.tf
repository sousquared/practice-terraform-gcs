resource "google_compute_global_address" "default" {
  name = "example-ip"
}

resource "google_compute_backend_bucket" "bucket_1" {
  name        = "cats"
  description = "Contains cat image"
  bucket_name = google_storage_bucket.bucket_1.name
}

resource "google_compute_backend_bucket" "bucket_2" {
  name        = "dogs"
  description = "Contains dog image"
  bucket_name = google_storage_bucket.bucket_2.name
}

resource "google_compute_url_map" "default" {
  name            = "http-lb"
  default_service = google_compute_backend_bucket.bucket_1.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "path-matcher-2"
  }

  path_matcher {
    name            = "path-matcher-2"
    default_service = google_compute_backend_bucket.bucket_1.id

    path_rule {
      paths   = ["/love-to-fetch/*"]
      service = google_compute_backend_bucket.bucket_2.id
    }
  }
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "http-lb-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}
