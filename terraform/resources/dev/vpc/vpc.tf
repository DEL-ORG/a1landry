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

  cidr = "10.0.0.0/16"

  availability_zone = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]

  num_nat_gw = 1

}

module "vpc" {
  source            = "../../../modules/vpc"
  aws_region        = local.aws_region
  profile           = local.profile
  common_tags       = local.common_tags
  cidr              = local.cidr
  availability_zone = local.availability_zone
  num_nat_gw        = local.num_nat_gw
}