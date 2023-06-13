# create security group

resource "aws_security_group" "web_sg" {
vpc_id = "${ aws_vpc.my_vpc.id}"


# inbound rules 
# http access form anywhere
ingress {
from_port = 80
to_port = 80 
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

# http access form anywhere
ingress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}



# SSH access from anywhere

ingress {
from_port = 22
to_port = 22 
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

#outbound rules 
# internet access form anywhere
egress{
from_port = 0
to_port = 0
protocol = "-1" 
cidr_blocks= ["0.0.0.0/0"]
}
tags = {
Name = "Web-SG"
}
}



