
variable "aws_region" {
  description = "aws region"
  default = "us-east-1"
}


 variable "vpc_id" {
  description = "VPC ID where EC2 will be created"
  default     = "vpc-015a6f9e57215f3a5"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be created"
  default = "subnet-02025c3f59c340f0a"
  
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0866a3c8686eaeeba"
}

variable "key_name" {
  description = "EC2 key pair name"
  default     = "dev-wdp"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}