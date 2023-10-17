resource "aws_subnet" "private_subnets" {
    count = length(var.public_subnet_cidrs)
    vpc_id = local.vpc_id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = false
    tags = {
       Name = "private-${var.private_subnet_cidrs[count.index]}-${local.az_names[count.index]}}"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = local.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }
    tags = {
        Name = "Private-RouteTable"
    }
}

resource "aws_route_table_association" "addRoute_private_rt" {
  count = "${length(local.az_names)}"
  subnet_id = local.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_rt.id
}