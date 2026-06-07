data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az_public           = var.az_public
  az_private          = var.az_private
}

module "security" {
  source = "./modules/security"

  project_name     = var.project_name
  vpc_id           = module.network.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "compute" {
  source = "./modules/compute"

  project_name          = var.project_name
  ami_id                = data.aws_ami.amazon_linux.id
  instance_type         = var.instance_type
  public_instance_name  = var.public_instance_name
  private_instance_name = var.private_instance_name
  key_name              = var.key_name

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  public_sg_id  = module.security.public_sg_id
  private_sg_id = module.security.private_sg_id
}