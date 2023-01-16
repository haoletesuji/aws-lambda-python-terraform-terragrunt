output "invoke_arn" {
  description = "ARN of Lambda Function"
  value       = aws_lambda_function.lambda_function.invoke_arn

}

output "function_name" {
  description = "Name of the Lambda Function."
  value       = aws_lambda_function.lambda_function.function_name
}

