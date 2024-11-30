variable "aws_region" {
  type = string
}

variable "profile" {
  type = string

}

variable "common_tags" {
  description = "Tags to apply to the resources"
  type        = map(string)

}

variable "cidr" {
  type = string
}

variable "availability_zone" {
  type = list(any)

}

variable "num_nat_gw" {
  type = number

}