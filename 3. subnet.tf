resource "aws_subnet" "user*-subnet1" {
  vpc_id            = aws_vpc.user*-vpc.id
  availability_zone = "ap-southeast-1a" # 본인이 속한 리전의 AZ을 입력합니다 ex) us-east-1a
  cidr_block        = "*.0.1.0/24"

  tags  = {
    Name = "user*-subnet1"
  }
}

resource "aws_subnet" "user*-subnet2" {
  vpc_id            = aws_vpc.user*-vpc.id
  availability_zone = "ap-southeast-1b" # 본인이 속한 리전의 AZ을 입력합니다 ex) us-east-1b
  cidr_block        = "*.0.2.0/24"

  tags  = {
    Name = "user*-subnet2"
  }
}
