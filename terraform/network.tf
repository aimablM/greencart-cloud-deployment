resource "aws_vpc" "greencart" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "greencart-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.greencart.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "greencart-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.greencart.id

  tags = {
    Name = "greencart-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.greencart.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}
