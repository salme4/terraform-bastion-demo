resource "aws_security_group" "allow-ssh-sg" {
  name = "allow-ssh"
  vpc_id = aws_vpc.bastion-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.resource_prefix}-ALLOW-SSH-SG"
  }
}

resource "aws_security_group" "web-server-sg" {
  name = "${var.resource_prefix}-web-server-sg"
  vpc_id = aws_vpc.bastion-vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.allow-ssh-sg.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.resource_prefix}-WEB-SERVER-SG"
  }
}
