resource "aws_subnet" "bastion-public-subnet-1" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 1)
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch=true
  tags = {
    Name = "${var.resource_prefix}-PUB-1"
  }
}

resource "aws_subnet" "bastion-public-subnet-2" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 2)
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch=true
  tags = {
    Name = "${var.resource_prefix}-PUB-2"
  }
}

resource "aws_subnet" "bastion-public-subnet-3" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 3)
  availability_zone = data.aws_availability_zones.available.names[3]
  map_public_ip_on_launch=true
  tags = {
    Name = "${var.resource_prefix}-PUB-3"
  }
}

resource "aws_subnet" "bastion-private-subnet-1" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 4)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.resource_prefix}-PRV-1"
  }
}

resource "aws_subnet" "bastion-private-subnet-2" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 5)
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "${var.resource_prefix}-PRV-2"
  }
}

resource "aws_subnet" "bastion-private-subnet-3" {
  vpc_id = aws_vpc.bastion-vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 6)
  availability_zone = data.aws_availability_zones.available.names[3]
  tags = {
    Name = "${var.resource_prefix}-PRV-3"
  }
}