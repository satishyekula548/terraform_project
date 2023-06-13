resource "aws_internet_gateway" "MyIgw" {
vpc_id = "${aws_vpc.my_vpc.id}"
tags = {
Name = "my_igw"
}
}

