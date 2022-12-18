resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_1_cidr
  map_public_ip_on_launch = "true" 
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_2_cidr
  map_public_ip_on_launch = "true" 
}



resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_1_cidr
  map_public_ip_on_launch = "false" 
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_2_cidr
  map_public_ip_on_launch = "false" 
}
