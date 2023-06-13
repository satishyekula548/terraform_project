# Create external loadbalance for application

resource "aws_lb" "external-alb" {
  name               = "external-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.MyPubSn-1.id,aws_subnet.MyPubSn-2.id]
}

resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}


resource "aws_lb_target_group_attachment" "tg-attachement" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.pub_ec2-1[0].id
  port             = 80
  depends_on       = [aws_instance.pub_ec2-1, ]
}


resource "aws_lb_target_group_attachment" "tg-attachement-1" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.pub_ec2-2[0].id
  port             = 80
  depends_on       = [aws_instance.pub_ec2-2,]
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb.arn
  }
}

