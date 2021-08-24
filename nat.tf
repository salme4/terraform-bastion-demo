resource "aws_eip" "bastion_eip" {
  vpc = true
  tags = {
    Name = "${var.resource_prefix}-EIP"
  }
}

resource "aws_nat_gateway" "bastion-nat" {
  allocation_id = aws_eip.bastion_eip.id
  subnet_id = aws_subnet.bastion-public-subnet-1.id
  tags = {
    Name = "${var.resource_prefix}-Nat-Gateway"
  }
}