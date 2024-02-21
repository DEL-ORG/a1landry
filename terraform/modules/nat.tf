resource "aws_nat_gateway" "main" {
  count         = length(var.azs)
  allocation_id = aws_eip.main[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
}

resource "aws_eip" "main" {
  count = length(var.azs)
  
  
}