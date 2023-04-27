variable "region" {
    default = "us-east-2"
}

variable vpc_map {
    default = {
        name = "general_vpc"
        cidr_block = "10.10.0.0/16"
        instance_tenancy = "default"
        enable_dns_support = true
        enable_dns_hostnames = true
    }
}

variable "subnet_map" {
  default = [
    { 
      subnet_name = "public"
      map_public_ip_on_launch = true
      subnet_cidr_block = [
        # "0:10.10.1.0/24",
        # "1:10.10.2.0/24",
        "2:10.10.3.0/24"
      ]
    },
    { 
      subnet_name = "private"
      map_public_ip_on_launch = false
      subnet_cidr_block = [
        # "0:10.10.10.0/24",
        "1:10.10.20.0/24",
        "2:10.10.30.0/24"
      ]
    },
    { 
      subnet_name = "db"
      map_public_ip_on_launch = false
      subnet_cidr_block = [
        # "0:10.10.15.0/24",
        "1:10.10.25.0/24",
        "2:10.10.35.0/24"
      ]
    },
  ]
}
