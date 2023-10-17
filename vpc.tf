
resource "aws_vpc" "discogs_vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_internet_gateway" "discogs_igw" {
    vpc_id = local.vpc_id
    tags = {
        Name = "${var.vpc_name}-igw"
       
    }
}

# Nat Gateway Elastic IP
resource "aws_eip" "nat-gw-eip" {
  domain   = "vpc"
  tags = {
    Name = "nat-gw-eip"
  }
}


resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nat-gw-eip.id
    subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat-gw"
  }

  depends_on = [aws_internet_gateway.discogs_igw]
}


