
# my first EC2_1 public

resource "aws_instance" "pub_ec2-1" {
  ami                         = "ami-03cb1380eec7cc118"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "deployer-key"
  vpc_security_group_ids      = ["${aws_security_group.web_sg.id}"]
  subnet_id                   = aws_subnet.MyPubSn-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "public_Ec2-1"
  }
}


# Sccond Ec2 insatance in public

resource "aws_instance" "pub_ec2-2" {
  ami                         = "ami-03cb1380eec7cc118"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "deployer-key"
  vpc_security_group_ids      = ["${aws_security_group.web_sg.id}"]
  subnet_id                   = aws_subnet.MyPubSn-2.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "public_Ec2-2"
  }
}


