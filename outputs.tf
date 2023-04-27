output "vpc_id" {
    value = aws_vpc.this_vpc.id
}

output "vpc_arn" {
    value = aws_vpc.this_vpc.arn
}

output "subnet_id" {
    value = [for k,v in aws_subnet.this_subnet: "${k}: ${v.id}"]
}

output "subnet_arn" {
    value = [for k,v in aws_subnet.this_subnet: "${k}: ${v.arn}"]
}
# output "y2" {
#     value = local.subnet_groups_map
# }