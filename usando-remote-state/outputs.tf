output "vpc_id" {
  value = aws_vpc.this.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.this : v.tags.Name => v.id }
}

output "ec2" {
  value = aws_instance.ec2.id
}