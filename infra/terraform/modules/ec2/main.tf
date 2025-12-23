resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami                    = "ami-0c398cb65a93047f2"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name = var.ssh_key_name
  user_data              = var.user_data
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    delete_on_termination = true
  }

  tags = { Name = var.instance_name }
}