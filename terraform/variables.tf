variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name prefix for resource naming"
  type        = string
  default     = "lab-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az_public" {
  description = "Availability Zone for public subnet"
  type        = string
  default     = "ap-southeast-1a"
}

variable "az_private" {
  description = "Availability Zone for private subnet"
  type        = string
  default     = "ap-southeast-1b"
}

variable "allowed_ssh_cidr" {
  description = "Trusted public IP in CIDR format"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name in AWS"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_instance_name" {
  description = "Name tag for public EC2"
  type        = string
  default     = "public-ec2"
}

variable "private_instance_name" {
  description = "Name tag for private EC2"
  type        = string
  default     = "private-ec2"
}