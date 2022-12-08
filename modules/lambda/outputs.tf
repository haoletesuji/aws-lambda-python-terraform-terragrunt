output "hello_invoke_arn" {
  description = "The output of the archive file."
  value       = aws_lambda_function.hello.invoke_arn

}

output "hello_function_name" {
  description = "The output of the archive file."
  value       = aws_lambda_function.hello.function_name
}

