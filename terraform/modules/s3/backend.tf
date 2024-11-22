# terraform {
#   backend "s3" {
#     bucket         = "2411-development-6_Figures_project-tf-state"
#     key            = "Devops/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "2411-development-6_Figures_project-tf-state-lock"
#     encrypt        = true
#   }
# }