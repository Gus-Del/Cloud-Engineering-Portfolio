variable "bucket_name" {
  description = "Globally unique S3 bucket name. Do not commit a name that includes an account ID if you do not want it public."
  type        = string
}
