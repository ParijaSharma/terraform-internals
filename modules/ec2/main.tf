
resource "aws_launch_template" "ec2_template" {
  name_prefix   = "terraform-ec2-"
  image_id     = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "terraform ec2 setup is working" > /var/www/html/index.html
              EOF
  )
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform-ec2"
    }
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "terraform-ec2-sg"
  vpc_id     = var.vpc_id

  tags = {
    Name = "terraform-ec2-sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "my_instance1" {
    launch_template {
      id      = aws_launch_template.ec2_template.id
      version = "$Latest"
    }
    subnet_id = var.private_subnet_ids[0]
    vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
    associate_public_ip_address = false

  tags = {
    Name = var.instance_name1
  }
}

resource "aws_instance" "my_instance2" {
    launch_template {
      id = aws_launch_template.ec2_template.id
      version = "$Latest"
    }
    subnet_id = var.private_subnet_ids[1]
    associate_public_ip_address = false

  tags = {
    Name = var.instance_name2
  }
}

