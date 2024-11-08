provider "aws" {
  region = local.aws_region
}

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
  aws_region                    = "us-east-1"
  instance_type                 = "t2.micro"
  key_name                      = "dev-wdp"
  
  tags = {
   "Owner"        = "Guy Landry"
   "Teams"        = "DevOps"
   "Project"      = "ec2"
   "Environment"  = "Dev"
   "created_by"   = "Terraform"
  }
}

module "ec2" {
  source                        = "../../modules/ec2"
  aws_region                    = local.aws_region
  instance_type                 = local.instance_type
  key_name                      = local.key_name
  tags                          = local.tags
}