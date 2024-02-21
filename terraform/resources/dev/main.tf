terraform {
  required_version = ">= 1.2.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"

  tags = {
    "id"             = "2024"
    "owner"          = "Six Figures Group"
    "teams"          = "Students"
    "environment"    = "Home"
    "project"        = "learn"
    "create_by"      = "Landry"
    "cloud_provider" = "aws"
  }

  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidr_blocks = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  vpc_cidr_block             = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

}

module "vpc" {
  source                     = "../../modules/"
  region                     = local.region
  tags                       = local.tags
  vpc_cidr_block             = local.vpc_cidr_block
  azs                        = local.azs
  public_subnet_cidr_blocks  = local.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = local.private_subnet_cidr_blocks
}