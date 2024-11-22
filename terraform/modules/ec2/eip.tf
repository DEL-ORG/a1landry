# Step 1: Allocate an Elastic IP
resource "aws_eip" "jenkins_eip" {
  tags = merge(var.tags, {
    Name = format("%s-%s-${var.resource_type}", var.tags["environment"], var.tags["project"])
  })
}

# Step 2: Associate the EIP with a Network Interface
resource "aws_eip_association" "eip_assoc" {
  allocation_id = aws_eip.jenkins_eip.id
  instance_id   = aws_instance.ec2.id
}