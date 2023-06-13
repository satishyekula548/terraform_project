# private route table 

resource "aws_route_table" "pvt_route"{
vpc_id = "${ aws_vpc.my_vpc.id}"
tags = {
Name = "my-pvt-rt"
}
}


# Route table association for private subnet_1

resource "aws_route_table_association" "p_rt1"{
route_table_id = "${aws_route_table.pvt_route.id}"
subnet_id = "${aws_subnet.MyAppSn-1.id}"
}


# Route table association for private subnet_2

resource "aws_route_table_association" "p_rt2"{
route_table_id = "${aws_route_table.pvt_route.id}"
subnet_id = "${aws_subnet.MyAppSn-2.id}"
}


# Route table association for private subnet_3

resource "aws_route_table_association" "p_rt3"{
route_table_id = "${aws_route_table.pvt_route.id}"
subnet_id = "${aws_subnet.db_sub_1.id}"
}

# Route table association for private subnet_4

resource "aws_route_table_association" "p_rt4"{
route_table_id = "${aws_route_table.pvt_route.id}"
subnet_id = "${aws_subnet.db_sub_2.id}"
}

