output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = module.network.private_subnet_id
}

output "default_security_group_id" {
  description = "Default security group ID of the VPC"
  value       = module.network.default_security_group_id
}

output "public_security_group_id" {
  description = "Security group ID of public EC2"
  value       = module.security.public_sg_id
}

output "private_security_group_id" {
  description = "Security group ID of private EC2"
  value       = module.security.private_sg_id
}

output "public_instance_id" {
  description = "Public EC2 instance ID"
  value       = module.compute.public_instance_id
}

output "public_instance_public_ip" {
  description = "Public IP of public EC2"
  value       = module.compute.public_instance_public_ip
}

output "private_instance_id" {
  description = "Private EC2 instance ID"
  value       = module.compute.private_instance_id
}

output "private_instance_private_ip" {
  description = "Private IP of private EC2"
  value       = module.compute.private_instance_private_ip
}

output "ami_id" {
  description = "AMI ID"
  value       = data.aws_ami.amazon_linux.id
}