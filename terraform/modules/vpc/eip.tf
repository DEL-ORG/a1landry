resource "aws_eip" "a1landry_eip" {
  count = length(var.availability_zone)
  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_eip-${count.index}", var.common_tags["id"])
    }
  )
  depends_on = [aws_internet_gateway.a1landry_igw]
}