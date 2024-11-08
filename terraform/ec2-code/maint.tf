resource "aws_instance" "ec2_demo" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id       = var.subnet_id  # Replace with your subnet ID if needed
  associate_public_ip_address = true

  tags = {
    Name = "ec2_demo"
  }
}