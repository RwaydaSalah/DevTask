output "backend_public_ip" {
  description = "Backend instance public IP"
  value       = aws_instance.backend.public_ip
}

output "frontend_public_ip" {
  description = "Frontend instance public IP"
  value       = aws_instance.frontend.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "sns_topic_arn" {
  value = aws_sns_topic.alarms.arn
}
output "frontend_ec2_id" {
  value = aws_instance.frontend.id
}


output "backend_ec2_id" {
  value = aws_instance.backend.id
}
