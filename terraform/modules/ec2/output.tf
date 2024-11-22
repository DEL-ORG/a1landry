output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

output "subnet_id" {
  value = data.aws_subnet.subnet_public.id
}

output "ec2_ami" {
  value = data.aws_ami.latest_amazon_linux_hvm.id
}