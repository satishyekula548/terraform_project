# Public-subnet-1
resource "aws_subnet" "MyPubSn-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "my_pub_sn_1"
  }
}

#Public-subnet-2
resource "aws_subnet" "MyPubSn-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "my_pub_sn_2"
  }
}

#application-subnet-1
resource "aws_subnet" "MyAppSn-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "my_app_sn_1"
  }
}

#application-subnet-2
resource "aws_subnet" "MyAppSn-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "my_app_sn_2"
  }
}

#database-private-subnet-1
resource "aws_subnet" "db_sub_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.9.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "my_database_sn_1"
  }
}

#database-private-subnet-2
resource "aws_subnet" "db_sub_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "my_database_sn_2"
  }
}




