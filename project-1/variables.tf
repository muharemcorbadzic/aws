variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0c7217cdde317cfec"
    eu-east-2 = "ami-05fb0b8c1424f266b"
    eu-west-1 = "ami-0c24ee2a1e3b9df45"
  }
}

variable "subnet_prefix" {
  description = "cidr block for the subnet"
  default     = "10.0.1.0/24"
  type        = string
}
