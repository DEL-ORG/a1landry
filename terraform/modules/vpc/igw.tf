resource "aws_internet_gateway" "a1landry_igw" {
  vpc_id = aws_vpc.a1landry_vpc.id

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_igw", var.common_tags["id"])
    }
  )
}