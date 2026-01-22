provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh_http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "ansible" {
  ami                    = "ami-06f1fc9ae5ae7f31e"
  instance_type          = "c7i-flex.large"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "Ansible-Server"
  }
}

resource "aws_instance" "java" {
  ami                    = "ami-06f1fc9ae5ae7f31e"
  instance_type          = "c7i-flex.large"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "Java-Node"
  }
}

resource "aws_instance" "nginx" {
  ami                    = "ami-06f1fc9ae5ae7f31e"
  instance_type          = "c7i-flex.large"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "Nginx-Node"
  }
}
