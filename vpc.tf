resource "aws_vpc" "bastion-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.resource_prefix}-VPC"
  }
}