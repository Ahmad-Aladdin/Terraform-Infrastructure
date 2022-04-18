output vpc_cider{
value = aws_vpc.myVPC.cidr_block
}

output "myVpc_id" {
    value = aws_vpc.myVPC.id
}

output "public_subnet_1a-ID" {
  value = aws_subnet.sub-pub-1a.id
}

output "public_subnet_1b-ID" {
  value = aws_subnet.sub-pub-1b.id
}

output "private_subnet_1a-ID" {
  value = aws_subnet.sub-pri-1a.id
}

output "private_subnet_1b-ID" {
  value = aws_subnet.sub-pri-1b.id
}