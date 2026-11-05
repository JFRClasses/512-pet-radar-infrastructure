provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "keys" {
  key_name = "${var.environment}-key"
  public_key = file(var.key_path)
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd*/ubuntu-*-26.04-amd64-server-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "pet_radar_server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name = aws_key_pair.keys.key_name
  vpc_security_group_ids = [aws_security_group.pet_radar_sg.id]
  user_data = templatefile("${path.module}/scripts/start.sh",{})
  root_block_device {
    volume_size = 20
  }
}