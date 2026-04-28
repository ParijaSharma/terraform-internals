terraform apply output:
    parija@parisUbuntu:~/Desktop/terraform-internal/terraform-project$ terraform apply 
    module.vpc.aws_eip.my_eip: Refreshing state... [id=eipalloc-0f88df143c6c9d20c]
    module.vpc.aws_vpc.my_vpc: Refreshing state... [id=vpc-017f6b994e599eca3]
    module.ec2.aws_launch_template.ec2_template: Refreshing state... [id=lt-07c9ddbed5cf2a10a]
    module.vpc.aws_internet_gateway.igw: Refreshing state... [id=igw-0440a3bca311fc4a2]
    module.vpc.aws_subnet.public_subnet2: Refreshing state... [id=subnet-08b713a4e9701d94a]
    module.vpc.aws_subnet.private_subnet2: Refreshing state... [id=subnet-0af7c248505aede10]
    module.vpc.aws_subnet.private_subnet1: Refreshing state... [id=subnet-0dc9417f8bf29640c]
    module.vpc.aws_subnet.public_subnet1: Refreshing state... [id=subnet-044dd3154a62ef0a7]
    module.alb.aws_security_group.alb_sg: Refreshing state... [id=sg-035756d52b2eb60d8]
    module.alb.aws_lb_target_group.my_tg: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:172033174965:targetgroup/my-target-group/55c41594b9d00a0b]
    module.vpc.aws_route_table.public: Refreshing state... [id=rtb-0ba22bec8f54a7ea5]
    module.ec2.aws_instance.my_instance2: Refreshing state... [id=i-0bfc18f05ddf775dc]
    module.vpc.aws_nat_gateway.my_nat_gateway: Refreshing state... [id=nat-017634c39a85b1853]
    module.vpc.aws_route_table_association.pub1: Refreshing state... [id=rtbassoc-0ce7a9fd222e6ff8e]
    module.vpc.aws_route_table_association.pub2: Refreshing state... [id=rtbassoc-028fd686e837de318]
    module.ec2.aws_security_group.ec2_security_group: Refreshing state... [id=sg-0af6e9bd83cd8ce70]
    module.alb.aws_lb.my_alb: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:172033174965:loadbalancer/app/my-alb/85120e2b321f525d]
    module.vpc.aws_route_table.private: Refreshing state... [id=rtb-010fe816277dc7582]
    module.vpc.aws_route_table_association.pri2: Refreshing state... [id=rtbassoc-0b0ee5f6045ab860e]
    module.vpc.aws_route_table_association.pri1: Refreshing state... [id=rtbassoc-078fa50b1d5177c0d]
    module.ec2.aws_instance.my_instance1: Refreshing state... [id=i-03e14d033f3483cfd]
    module.alb.aws_lb_listener.listener: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:172033174965:listener/app/my-alb/85120e2b321f525d/f0e22ec33d8224d5]
    aws_lb_target_group_attachment.attach_tg[0]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:172033174965:targetgroup/my-target-group/55c41594b9d00a0b,i-03e14d033f3483cfd,80]
    aws_lb_target_group_attachment.attach_tg[1]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:172033174965:targetgroup/my-target-group/55c41594b9d00a0b,i-0bfc18f05ddf775dc,80]
    
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
      ~ update in-place
    
    Terraform will perform the following actions:
    
      # module.ec2.aws_instance.my_instance1 will be updated in-place
      ~ resource "aws_instance" "my_instance1" {
            id                                   = "i-03e14d033f3483cfd"
            tags                                 = {
                "Name" = "terra1-ec2"
            }
          - user_data                            = <<-EOT
                #!/bin/bash
                apt update -y
                apt install -y nginx
                systemctl start nginx
                systemctl enable nginx
                echo "terraform ec2 setup is working" > /var/www/html/index.html
            EOT -> null
            # (40 unchanged attributes hidden)
    
            # (10 unchanged blocks hidden)
        }
    
      # module.ec2.aws_instance.my_instance2 will be updated in-place
      ~ resource "aws_instance" "my_instance2" {
            id                                   = "i-0bfc18f05ddf775dc"
            tags                                 = {
                "Name" = "terra2-ec2"
            }
          - user_data                            = <<-EOT
                #!/bin/bash
                apt update -y
                apt install -y nginx
                systemctl start nginx
                systemctl enable nginx
                echo "terraform ec2 setup is working" > /var/www/html/index.html
            EOT -> null
            # (40 unchanged attributes hidden)
    
            # (10 unchanged blocks hidden)
        }
    
    Plan: 0 to add, 2 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    module.ec2.aws_instance.my_instance2: Modifying... [id=i-0bfc18f05ddf775dc]
    module.ec2.aws_instance.my_instance1: Modifying... [id=i-03e14d033f3483cfd]
    module.ec2.aws_instance.my_instance1: Still modifying... [id=i-03e14d033f3483cfd, 00m10s elapsed]
    module.ec2.aws_instance.my_instance2: Still modifying... [id=i-0bfc18f05ddf775dc, 00m10s elapsed]
    module.ec2.aws_instance.my_instance2: Still modifying... [id=i-0bfc18f05ddf775dc, 00m20s elapsed]
    module.ec2.aws_instance.my_instance1: Still modifying... [id=i-03e14d033f3483cfd, 00m20s elapsed]
    module.ec2.aws_instance.my_instance2: Still modifying... [id=i-0bfc18f05ddf775dc, 00m30s elapsed]
    module.ec2.aws_instance.my_instance1: Still modifying... [id=i-03e14d033f3483cfd, 00m30s elapsed]
    module.ec2.aws_instance.my_instance1: Still modifying... [id=i-03e14d033f3483cfd, 00m40s elapsed]
    module.ec2.aws_instance.my_instance2: Still modifying... [id=i-0bfc18f05ddf775dc, 00m40s elapsed]
    module.ec2.aws_instance.my_instance1: Modifications complete after 46s [id=i-03e14d033f3483cfd]
    module.ec2.aws_instance.my_instance2: Modifications complete after 48s [id=i-0bfc18f05ddf775dc]
    
    Apply complete! Resources: 0 added, 2 changed, 0 destroyed.
    
    Outputs:
    
    alb_dns = "my-alb-1044721478.us-east-1.elb.amazonaws.com"
    instance_ids = [
      "i-03e14d033f3483cfd",
      "i-0bfc18f05ddf775dc",
    ]
    private_subnet = [
      "subnet-0dc9417f8bf29640c",
      "subnet-0af7c248505aede10",
    ]
    public_subnet = [
      "subnet-044dd3154a62ef0a7",
      "subnet-08b713a4e9701d94a",
    ]
    vpc_id = "vpc-017f6b994e599eca3"


<img width="1881" height="1091" alt="image" src="https://github.com/user-attachments/assets/082d7c56-d1e7-445a-afdf-3ce4aafa09fc" />

