data "aws_vpc" "vpc" {
  filter {
    name   = "tag:team" # Replace "Name" with your specific tag key
    values = ["wdp"]    # Replace "MyVPC" with your tag value
  }
}

data "aws_subnet" "subnet_public" {
  filter {
    name   = "tag:Name"          # Replace "Name" with your specific tag key
    values = ["subnet_public01"] # Replace with your tag value
  }
}

data "aws_ami" "jenkins-master-ami" {
  most_recent = true
  filter {
    name   = "tag:Name"          
    values = ["jenkins"] 
  }
}