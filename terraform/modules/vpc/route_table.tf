resource "aws_route_table" "a1landry_public_rt" {
  vpc_id = aws_vpc.a1landry_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a1landry_igw.id
  }

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_public_rt", var.common_tags["id"])
    }
  )
}


resource "aws_route_table" "a1landry_private_rt" {
  count  = length(var.availability_zone)
  vpc_id = aws_vpc.a1landry_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.a1landry_nat_gateway.*.id, count.index)
  }

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_private_rt-${count.index}", var.common_tags["id"])
    }
  )
}