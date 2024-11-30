resource "aws_nat_gateway" "a1landry_nat_gateway" {
  count = contains(["prod", "pre-prod"], var.common_tags["environment"]) ? length(var.availability_zone) : var.num_nat_gw

  allocation_id = element(aws_eip.a1landry_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.a1landry_public_subnet.*.id, count.index)

  tags = merge(var.common_tags, {
    Name = format("%s-a1landry_nat_gateway-${count.index}", var.common_tags["id"])
  })

  depends_on = [aws_internet_gateway.a1landry_igw]
}