#create,configure and attach route table to the PUBLIC SUBNETS

#create the route table itself
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}



#define how the route table will reach to igw

#create route/way
resource "aws_route" "public_route" {

#define which route table i wanna use and configure
  route_table_id     = aws_route_table.public_route_table.id

 
#which destination you want to reach in internet    
  destination_cidr_block    = "0.0.0.0/0"

#which igw i will use to reach this destination(public subnets uses igw to reach to internet)
  gateway_id = aws_internet_gateway.mygateway.id
}



#Attach the route table to the subnet i want 
#which subnet the route table will apply to it
#one route can be applied to more than one subnet

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_route_table.id
}

#########################################################

#create,configure and attach route table to the PRIVATE SUBNETS

#create the route table itself
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}


#define how the route table will reach to igw

#create route/way
resource "aws_route" "private_route" {

#define which route table i wanna use and configure
  route_table_id          = aws_route_table.private_route_table.id


#which destination you want to reach in internet    
  destination_cidr_block    = "0.0.0.0/0"

#which Nat Gateway i will use to reach this destination(private subnets uses Nat Gateway to reach to internet not igw)
    gateway_id = aws_nat_gateway.mynat.id
}



#Attach the route table to the subnet i want 
#which subnet the route table will apply to it
#one route can be applied to more than one subnet

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_route_table.id
}