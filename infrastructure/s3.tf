# --- lambda assets ---

resource "aws_s3_bucket" "lambda_assets_bucket" {
  bucket = "${local.project_prefix}-lambda-asssets-bucket"
}

resource "aws_s3_object" "lambda_source_code_upload" {
  bucket      = aws_s3_bucket.lambda_assets_bucket.id
  key         = "lambda/lambda.zip"
  source      = data.archive_file.source.output_path
  source_hash = filemd5(data.archive_file.source.output_path)
}

resource "aws_s3_bucket_notification" "s3_notificatio_trigger" {
  bucket     = aws_s3_bucket.lambda_assets_bucket.id
  depends_on = [aws_lambda_permission.s3_lambda_permission]
  lambda_function {
    lambda_function_arn = aws_lambda_function.trigger.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = local.s3_prefix
  }
}
