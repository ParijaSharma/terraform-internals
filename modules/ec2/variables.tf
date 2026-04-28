variable "instance_name1" {
  description = "name of my instance"
  type = string
  default = "terra1-ec2"
}
variable "instance_name2" {
  description = "name of my 2nd instance"
  type = string
  default = "terra2-ec2"
}
variable "ami_id" {
  type = string

}
variable "instance_type" {
  type = string
  default = "t3.micro"
}
variable "vpc_id" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)

}
variable "alb_sg_id" {
  type = string
}