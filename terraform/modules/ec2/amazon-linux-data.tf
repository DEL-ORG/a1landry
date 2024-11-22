data "aws_ami" "latest_amazon_linux_hvm" {
  most_recent = true
  owners      = ["137112412989"] # Amazon Linux 2 AMIs account ID

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # AMI name pattern
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"] # Ensure it's HVM virtualization
  }

  filter {
    name   = "state"
    values = ["available"] # Only fetch available AMIs
  }
}