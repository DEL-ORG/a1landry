provider "aws" {
  region = local.aws_region
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
  aws_region = "us-east-1"
  profile    = "default"
  common_tags = {
    "id"             = "2411"
    "owner"          = "EK TECH SOFTWARE SOLUTION"
    "environment"    = "development"
    "project"        = "6-figures-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "s3_backend" {
  source      = "../../../modules/s3"
  aws_region  = local.aws_region
  profile = local.profile
  common_tags = local.common_tags

}