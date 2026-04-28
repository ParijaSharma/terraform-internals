variable "alb_name" {
  description = "alb name"
  type = string
  default = "my-alb"
}
variable "alb_type" {
  type = string
  default = "application"
  
}
variable "public_subnet_ids" {
  type = list(string)
}

variable "target_name" {
  type = string
  default = "my-target-group"
}
variable "vpc_id" {
  type = string
}