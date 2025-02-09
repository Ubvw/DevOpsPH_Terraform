output "instance_private_ips" {
  description = "Private IPs of the instances"
  value       = aws_instance.instances[*].private_ip
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.bucket.bucket
}

output "route53_zone_id" {
  description = "Route 53 Zone ID"
  value       = aws_route53_zone.primary.zone_id
}

output "instance_ids" {
  value = aws_instance.instances[*].id
}