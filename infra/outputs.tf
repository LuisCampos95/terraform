output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igtw.id
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.subnet : v.tags.Name => v.id }
}

output "instance_ips" {
  value = aws_instance.this.*.public_ip
}