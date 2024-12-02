resource "aws_subnet" "a1landry_private_subnet" {
  count             = length(var.availability_zone)
  vpc_id            = aws_vpc.a1landry_vpc.id
  cidr_block        = cidrsubnet(var.cidr, 8, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_private_subnet-${count.index}", var.common_tags["environment"])
    }
  )
}
resource "aws_subnet" "a1landry_public_subnet" {
  count      = length(var.availability_zone)
  vpc_id     = aws_vpc.a1landry_vpc.id
  cidr_block = cidrsubnet(var.cidr, 6, count.index + 1)

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_public_subnet-${count.index}", var.commom_tags["environment"])
    
    }
  )
}