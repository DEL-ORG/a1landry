aws_region = "us-east-1"
common_tags = {
  "id"             = "2411"
  "owner"          = "EK TECH SOFTWARE SOLUTION"
  "environment"    = "development"
  "project"        = "6-figures-project"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}


cidr = "10.0.0.0/16"

availability_zone = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
]

num_nat_gw = 1

