resource "aws_instance" "public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "${var.project_name}-${var.public_instance_name}"
  }
}

resource "aws_instance" "private" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  key_name                    = var.key_name

  tags = {
    Name = "${var.project_name}-${var.private_instance_name}"
  }
}