#Elastic Ip For Nat Gateway
resource "aws_eip" "nat_ip" {

}


#Create Nat Gateway and put it in subnet public1
resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public1.id
}
