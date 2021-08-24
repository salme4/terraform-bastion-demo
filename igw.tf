resource "aws_internet_gateway" "bastion-igw" {
  vpc_id = aws_vpc.bastion-vpc.id

  tags = {
    Name = "${var.resource_prefix}-IGW"
  }
}