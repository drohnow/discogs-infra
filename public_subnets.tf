
resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnet_cidrs)
    vpc_id = local.vpc_id
    cidr_block = element(var.public_subnet_cidrs, count.index)
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true
    tags = {
       # Name = "public-192.168.${count.index + 1}.0/24"
       Name = "public-${var.public_subnet_cidrs[count.index]}-${local.az_names[count.index]}}"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = local.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.discogs_igw.id
    }
    tags = {
        Name = "Public-RouteTable"
    }
}

resource "aws_route_table_association" "addRoute_public_rt" {
    count = "${length(local.az_names)}"
    //subnet_id      = local.pub_subnet_ids[count.index]
    subnet_id = local.public_subnet_ids[count.index]
    route_table_id = aws_route_table.public_rt.id
}



