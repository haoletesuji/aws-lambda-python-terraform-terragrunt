output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.cert.arn
}
