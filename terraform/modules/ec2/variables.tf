variable "aws_region" {
  type    = string
}

variable "profile" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "key_name" {
  type    = string
  
}

variable "root_volume" {
  type    = number
  
}

variable "resource_type" {
  type    = string
  
}

variable "tags" {
  type = map(string)
  
}