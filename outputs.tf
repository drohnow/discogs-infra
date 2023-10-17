output "availability_zone" {
    description = "availability zones"
   // value = data.aws_availability_zones.azs.*.id
    //value = data.aws_availability_zones.available_azs.*.names
    value = data.aws_availability_zones.azs.*.names
}



output "last_element" {
  value = local.name3[2]
}

output "mysubet" {
    value = local.private_subnet_ids[0]
}