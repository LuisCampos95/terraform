# Saídas a serem visualizadas nos logs
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igtw.id
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.subnet : v.tags.Name => v.id }
}

output "sg_id" {
  value = aws_security_group.sg.id
}

output "public_ip" {
  value = module.aws_instance_ec2.public_ip
  depends_on = [
    module.aws_instance_ec2
  ]
}