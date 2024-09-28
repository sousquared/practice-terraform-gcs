variable "project_id" {
  description = "プロジェクトID"
  type        = string
  default     = "{YOUR_PROJECT_ID}"
}

variable "bucket_location" {
  description = "バケットのロケーション"
  type        = string
  default     = "asia-northeast1"
}

variable "region" {
  description = "デフォルトのリージョン"
  type        = string
  default     = "asia-northeast1"
}
