
variable "public_subnet_cidrs" {
    description = "value"
    type = list(string)
    default = ["192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24"]
}

variable "private_subnet_cidrs" {
    description = "value"
    type = list(string) 
    default = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]
}


