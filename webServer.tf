resource "aws_instance" "web-server-ec2" {
  ami = data.aws_ami.bastion-linux2.id
  instance_type = var.bastion_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.bastion-public-subnet-2.id
  key_name = var.bastion_key_pair_name
  vpc_security_group_ids = [aws_security_group.web-server-sg.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo amazon-linux-extras install -y nginx1 && sudo service nginx start
            EOF

  tags = {
    Name = "${var.resource_prefix}-WEB-SERVER"
  }
}