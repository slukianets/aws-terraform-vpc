provider "aws" {
    region = var.region
}

data "aws_availability_zones" "current" {}

resource "aws_vpc" "this_vpc" {
  cidr_block           = var.vpc_map["cidr_block"]
  instance_tenancy     = var.vpc_map["instance_tenancy"]
  enable_dns_support   = var.vpc_map["enable_dns_support"]
  enable_dns_hostnames = var.vpc_map["enable_dns_hostnames"]

  tags = {
    Name = var.vpc_map["name"]
  }
}


# resource "aws_internet_gateway" "this_gw" {
#   vpc_id = aws_vpc.this_vpc.id

#   tags = {
#     Name = "Kube-Cluster-IGW"
#   }
# }

resource "aws_subnet" "this_subnet" {
  for_each = local.subnet_groups_map
  vpc_id     = aws_vpc.this_vpc.id
  availability_zone_id = data.aws_availability_zones.current.zone_ids[each.value.az]
  map_public_ip_on_launch = each.value.public_ip_launch
  cidr_block = each.value.subnet_block

  tags = {
    Name = "subnet-${each.value.subnet_name}-az${each.value.az + 1}"
    Tier = each.value.subnet_name
  }
}