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
  ami           = var.ami_id
  instance_type = "c7i-flex.large"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Ansible-Server"
  }
}

resource "aws_instance" "java" {
  ami           = var.ami_id
  instance_type = "c7i-flex.large"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Java-Node"
  }
}

resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = "c7i-flex.large"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Nginx-Node"
  }
}
