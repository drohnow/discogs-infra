locals {
  vpc_id = aws_vpc.discogs_vpc.id
  az_names = data.aws_availability_zones.azs.names
 // az_zones = split("-", data.aws_availability_zones.azs.*.names)
  //az_zones = data.aws_availability_zones.azs.*.names
 name3 = split("-", var.Name)
 private_subnet_ids = aws_subnet.private_subnets.*.id
 //private_sub_ids = "${aws_subnet.private.*.id}"
 public_subnet_ids = aws_subnet.public_subnets.*.id
}