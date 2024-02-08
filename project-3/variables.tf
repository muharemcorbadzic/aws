variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0c7217cdde317cfec"
    eu-east-2 = "ami-05fb0b8c1424f266b"
    eu-west-1 = "ami-0905a3c97561e0b69"
  }
}

variable "vpc_cidr" {
  description = "Value of the CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Value of the name for the VPC"
  type        = string
  default     = "MyTestVPC"
}

variable "igw_name" {
  description = "Value of the Internet Gateway for the VPC"
  type        = string
  default     = "MyTestIGW"
}
