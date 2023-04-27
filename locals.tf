locals {

    subnet_groups_map = {
      for g in flatten([  
        for i in var.subnet_map: [
            for x in  setproduct([i.subnet_name], [i.map_public_ip_on_launch], i.subnet_cidr_block): {
                subnet_name      = x[0]
                public_ip_launch = x[1]
                subnet_block     = split(":", x[2])[1]
                az               = split(":", x[2])[0]
            }
        ]
      ]) : "${g.subnet_name}_${g.subnet_block}" => g
    }
}

