resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-public-subnet-${count.index + 1}-${element(var.azs, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])
    }
  )
}

resource "aws_subnet" "private" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = var.private_subnet_cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = format("%s-%s-%s-private-subnet-${count.index + 1}-${element(var.azs, count.index)}", var.tags["id"], var.tags["environment"], var.tags["project"])

  }
}
