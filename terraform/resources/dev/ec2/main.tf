provider "aws" {
  region  = local.aws_region
  profile = local.profile
}

## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  aws_region    = "us-east-1"
  profile       = "default"
  instance_type = "t2.micro"
  key_name      = "dev-wdp"
  root_volume   = 40
  resource_type = "ec2"
  tags = {
    "owner"          = "EK TECH SOFTWARE SOLUTION"
    "environment"    = "development"
    "project"        = "6-figures-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "ec2" {
  source        = "../../../modules/ec2"
  aws_region    = local.aws_region
  profile       = local.profile
  instance_type = local.instance_type
  key_name      = local.key_name
  root_volume   = local.root_volume
  resource_type = local.resource_type
  tags          = local.tags


}