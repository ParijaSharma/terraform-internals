terraform apply output:
 
    
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

