resource "aws_vpc" "this" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "Terraform VPC" })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "Terraform IGW" })
}

resource "aws_subnet" "this" {
  for_each = {
    "sub_a" : ["192.168.1.0/24", "${var.aws_region}a", "Subnet A"]
    "sub_b" : ["192.168.2.0/24", "${var.aws_region}b", "Subnet B"]
    "sub_c" : ["192.168.3.0/24", "${var.aws_region}c", "Subnet C"]
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]
  tags              = merge(local.common_tags, { Name = each.value[2] })
}