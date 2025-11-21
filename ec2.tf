resource "aws_instance" "backend" {
  ami                         = data.aws_ami.ubuntu_2204.id
  instance_type               = var.instance_type
  subnet_id                   = local.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
  }

  tags = {
    Name = "backend"
  }
}


resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.ubuntu_2204.id
  instance_type               = var.instance_type
  subnet_id                   = local.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
  }

  tags = {
    Name = "frontend"
  }
}



data "aws_ami" "ubuntu_2204" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
