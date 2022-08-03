resource "aws_route_table" "user*-rt" {
  vpc_id = aws_vpc.user*-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.user*-igw.id
  }

  tags = {
    Name = "user*-rt"
  }
}


resource "aws_route_table_association" "rt_subnet1" {
  subnet_id      = aws_subnet.user*-subnet1.id
  route_table_id = aws_route_table.user*-rt.id
}

resource "aws_route_table_association" "rt_subnet2" {
  subnet_id      = aws_subnet.user*-subnet2.id
  route_table_id = aws_route_table.user*-rt.id
}
