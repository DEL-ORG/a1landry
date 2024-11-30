resource "aws_vpc" "a1landry_vpc" {
  cidr_block = var.cidr
  tags = merge(var.common_tags, {
    Name = "a1landry_vpc"
    }

  )
}

