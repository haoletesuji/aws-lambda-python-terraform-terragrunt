output "hello_invoke_arn" {
  description = "ARN of Lambda Function"
  value       = aws_lambda_function.hello.invoke_arn

}

output "hello_function_name" {
  description = "Name of the Lambda Function."
  value       = aws_lambda_function.hello.function_name
}

