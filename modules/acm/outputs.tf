output "certificate_arn" {
  description = "Base URL for API Gateway stage."
  value       = aws_acm_certificate.cert.arn
}
