resource "aws_s3_bucket" "server_assets_bucket" {
  bucket = "${local.project_prefix}-server-assets-bucket"
}
