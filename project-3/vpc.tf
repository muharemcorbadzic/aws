# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# Create subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "main-private-1"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = var.igw_name
  }
}

# Create new route table with IGW
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  tags = {
    Name = var.igw_name
  }
}

# Associate route table with subnet
resource "aws_route_table_association" "main-public-1-rt-assoc" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "main-public-2-rt-assoc" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "mIN-public_1_rt_assoc" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.public_rt.id
}