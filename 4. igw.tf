resource "aws_internet_gateway" "user*-igw" {
  vpc_id = aws_vpc.user*-vpc.id

  tags = {
    Name = "user*-igw"
  }
}
