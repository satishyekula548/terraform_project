resource "aws_db_subnet_group" "default" {
  name       = "my_db_rds"
  subnet_ids = [aws_subnet.db_sub_1.id, aws_subnet.db_sub_2.id] 
}
resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  multi_az               = true
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
