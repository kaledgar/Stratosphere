data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../lambda"
  output_path = "../lambda/lambda.zip"
}
