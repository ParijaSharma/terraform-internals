output "alb_dns" {
  value = module.alb.alb_dns_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnet" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet" {
  value = module.vpc.public_subnet_ids
}

output "instance_ids" {
  value = [module.ec2.instance1_id, module.ec2.instance2_id]
}