resource "aws_instance" "demo_ec2" {
  ami           = data.aws_ami.ubuntu.id  
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = merge(
    var.tags,
    { Name = "demo_ec2" }
  )
}