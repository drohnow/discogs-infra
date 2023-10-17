
resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.amz_linux.id
  instance_type = "t3.micro"
  subnet_id = local.private_subnet_ids[0]
  availability_zone = local.az_names[0]
  //associate_public_ip_address = false
  key_name = "rafay"
  
  tags = {
    Name = "private01"
  }
}

resource "aws_instance" "bastion_instance" {
  ami           = data.aws_ami.amz_linux.id
  instance_type = "t3.micro"
  subnet_id = local.public_subnet_ids[1]
  availability_zone = local.az_names[1]
  //associate_public_ip_address = false
  key_name = "rafay"
  
  tags = {
    Name = "bastion01"
  }
}

resource "aws_security_group" "bastion-sg" {
 name        = "bastion-sg"
 description = "dagr.net access inbound"
 #vpc_id      = data.aws_vpc.default.id
 vpc_id = aws_vpc.my_vpc.id
 tags = {
    Name = "private-sg"
 }
}

resource "aws_security_group_rule" "allow_all_to_home" {
 type              = "ingress"
 description       = "ssh ingress from home office"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = [""]
security_group_id = aws_security_group.web-sg.id 
}


resource "aws_security_group_rule" "allow_all3" {
 type              = "egress"
 description       = "all traffic outbound"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
security_group_id = aws_security_group.web-sg.id 
}

