resource "aws_lb" "my_alb" {
  name = var.alb_name
  load_balancer_type = var.alb_type
  security_groups= [aws_security_group.alb_sg.id]
  subnets= var.public_subnet_ids
  tags = {
    Name = var.alb_name
  }
}

resource "aws_security_group" "alb_sg" {
  name = var.alb_name
  vpc_id = var.vpc_id 
  ingress {
    from_port = 80
    to_port = 80
    protocol= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port  = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "my_tg" {
    name= var.target_name
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
        path = "/"
        interval = 30
        timeout = 5
        port = "traffic-port"
    }

}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port  = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}