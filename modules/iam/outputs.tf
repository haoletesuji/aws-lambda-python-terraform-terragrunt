output "exec_role_arn" {
  description = "The output of the archive file."
  value       = aws_iam_role.lambda.arn
}
