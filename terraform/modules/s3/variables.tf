
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "common_tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default = {
    "id"             = "2411"
    "owner"          = "EK TECH SOFTWARE SOLUTION"
    "environment"    = "development"
    "project"        = "6-figures-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  
}
}
