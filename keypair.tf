resource "tls_private_key" "web-ssh-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "web-keypair" {
  key_name   = "${var.resource_prefix}-web-keypair"
  public_key = tls_private_key.web-ssh-key.public_key_openssh
}

resource "tls_private_key" "bastion-ssh-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "bastion-keypair" {
  key_name   = "${var.resource_prefix}-bastion-keypair"
  public_key = tls_private_key.bastion-ssh-key.public_key_openssh
}