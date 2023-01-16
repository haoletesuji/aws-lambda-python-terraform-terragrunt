# Define a local variable for the Lambda function
# source code path in order to avoid repetitions.
locals {
  # Relative paths change if this configuration is
  # included as a module from Terragrunt.
  lambda_source_path = "${path.module}${var.lambda_relative_path}src"
  lambda_output_path = "${path.module}${var.lambda_relative_path}src.zip"
}

# Create an archive form the Lambda source code,
# filtering out unneeded files.
data "archive_file" "lambda_source_package" {
  type        = "zip"
  source_dir  = local.lambda_source_path
  output_path = local.lambda_output_path
}


resource "aws_s3_object" "s3_object" {
  bucket = var.lambda_bucket_id
  key    = "${var.function_name}.zip"
  source = data.archive_file.lambda_source_package.output_path
  etag   = filemd5(data.archive_file.lambda_source_package.output_path)
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = var.function_name
  s3_bucket        = var.lambda_bucket_id
  s3_key           = aws_s3_object.s3_object.key
  runtime          = var.runtime
  handler          = var.handler
  source_code_hash = data.archive_file.lambda_source_package.output_base64sha256
  role             = var.exec_role_arn
}

