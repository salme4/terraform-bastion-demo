resource "aws_route_table" "bastion-pub-rt" {
  vpc_id = aws_vpc.bastion-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.bastion-igw.id
  }

  tags = {
    Name = "${var.resource_prefix}-PUB-RT"
  }
}

resource "aws_route_table_association" "pub-1" {
  subnet_id = aws_subnet.bastion-public-subnet-1.id
  route_table_id = aws_route_table.bastion-pub-rt.id
}

resource "aws_route_table_association" "pub-2" {
  subnet_id = aws_subnet.bastion-public-subnet-2.id
  route_table_id = aws_route_table.bastion-pub-rt.id
}

resource "aws_route_table" "bastion-prv-rt" {
  vpc_id = aws_vpc.bastion-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.bastion-nat.id
  }
  tags = {
    Name = "${var.resource_prefix}-PRV-RT"
  }
}

resource "aws_route_table_association" "prv-1" {
  subnet_id = aws_subnet.bastion-private-subnet-1.id
  route_table_id = aws_route_table.bastion-prv-rt.id
}

resource "aws_route_table_association" "prv-2" {
  subnet_id = aws_subnet.bastion-private-subnet-2.id
  route_table_id = aws_route_table.bastion-prv-rt.id
}