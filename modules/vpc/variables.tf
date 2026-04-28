variable "az1" {
    description = "my availability zone 1"
    type = string
    default = "us-east-1a"
}
variable "az2" {
    description = "my availability zone 2"
    type = string
    default = "us-east-1b"
}
variable "vpc_name" {
  description = "this is name of vpc"
  type = string
  default = "my-vpc"
}
variable "cidr_block" {
  description = "this is cidr block for vpc"
  type = string
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "cidr block for public subnet"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidr" {
  description = "cidr block for private subnet"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "igw_name" {
  type = string
  default = "my-igw"
}
variable "nat_name" {
  type= string
  default = "my-nat-gateway"
}

variable "public_route_table" {
  type = string
  default = "public-rt"
}

variable "private_route_table" {
  type = string
  default = "private-rt"
}