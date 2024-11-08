aws_region    = "us-east-1"
instance_type = "t2.micro"
key_name      = "dev-wdp"

tags = {
  "Owner"        = "Guy Landry"
   "Teams"        = "DevOps"
   "Project"      = "ec2"
   "Environment"  = "Dev"
   "created_by"   = "Terraform"
}