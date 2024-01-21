locals {
  project_prefix = "${var.unique_prefix}-${var.aws_region}-${var.environment}"
  s3_prefix      = "trigger_files/"
}
