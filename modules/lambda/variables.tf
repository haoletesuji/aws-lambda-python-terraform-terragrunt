variable "lambda_bucket_id" {
  description = "Name of the bucket to put the file in"
  type        = string
}

variable "exec_role_arn" {
  description = " Amazon Resource Name (ARN) of the function's execution role."
  type        = string
}


variable "lambda_relative_path" {
  description = "The path to content to the archive "
  type        = string
}

variable "function_name" {
  description = "Unique name for your Lambda Function."
  type        = string
}

variable "handler" {
  description = "Function entrypoint in your code."
  type        = string
}


variable "runtime" {
  description = " Identifier of the function's runtime."
  type        = string
}
