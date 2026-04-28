variable "ami_id" {
  
}
variable "cidr_block" {
  
}
variable "az1" {
  
}
variable "az2" {

}
variable "instance_type" {
  type = string
}
variable "public_subnet_cidr" {
  type = list(string)
}
variable "private_subnet_cidr" {
  type = list(string)
}
variable "instance_name1" {
  type = string
}
variable "instance_name2" {
  type = string
}
