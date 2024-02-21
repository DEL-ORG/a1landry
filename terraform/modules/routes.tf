resource "aws_route_table" "public" {
  count  = length(var.azs)
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-public-route-table", var.tags["id"], var.tags["environment"], var.tags["project"])
    }
  )
}

resource "aws_route_table_association" "public" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table" "private" {
  count  = length(var.azs)
  vpc_id = aws_vpc.demo.id

  tags = merge(var.tags, {
    Name = format("%s-%s-%s-private-route-table", var.tags["id"], var.tags["environment"], var.tags["project"])
    }
  )
}

resource "aws_route_table_association" "private" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "main-igw"
  }
}