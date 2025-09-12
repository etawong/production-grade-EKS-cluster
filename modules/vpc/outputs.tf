output "vpc_id" {
  description = "The VPC ID."
  value       = aws_vpc.main.id
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet."
  value       = aws_subnet.private_zone1.id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet."
  value       = aws_subnet.private_zone2.id
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet."
  value       = aws_subnet.public_zone1.id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet."
  value       = aws_subnet.public_zone2.id
}

output "dev_instance_id" {
  description = "The ID of the dev instance."
  value       = aws_instance.dev.id
}

output "dev_instance_public_ip" {
  description = "The public IP of the dev instance."
  value       = aws_instance.dev.public_ip
}

output "backend_ecr_repository_url" {
  description = "The URL of the backend ECR repository."
  value       = aws_ecr_repository.backend.repository_url
}

output "frontend_ecr_repository_url" {
  description = "The URL of the frontend ECR repository."
  value       = aws_ecr_repository.frontend.repository_url
}