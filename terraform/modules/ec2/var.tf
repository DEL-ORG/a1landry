variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default     = {
    Owner        = "Guy Landry"
    Teams        = "DevOps"
    Project      = "ec2"
    Environment  = "Dev"
    created_by   = "Terraform"
  }
}