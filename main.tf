module "vpc" {
  source = "../modules/vpc"
  cidr_block= var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az1= var.az1
  az2= var.az2
}

module "alb" {
  source = "../modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids

}

module "ec2" {
  source = "../modules/ec2"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ami_id = var.ami_id
  instance_name1 = var.instance_name1
  instance_name2 = var.instance_name2
  instance_type= var.instance_type
  alb_sg_id = module.alb.alb_sg_id
}

resource "aws_lb_target_group_attachment" "attach_tg" {
  count = 2
  target_group_arn = module.alb.target_group_arn
  target_id = [module.ec2.instance1_id, module.ec2.instance2_id][count.index]
  port = 80
}

terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-2006"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}