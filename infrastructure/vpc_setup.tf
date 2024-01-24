###############################
##------------VPC--------------
###############################

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

###############################
##-----------SUBNET------------
###############################

resource "aws_subnet" "main_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = aws_vpc.main.cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
}

###############################
##--------ROUTE-TABLE----------
###############################

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id      = aws_subnet.main_subnet_a.id
  route_table_id = aws_route_table.rt.id
}

###############################
##-------SECURITY-GROUP--------
###############################

resource "aws_security_group" "webtraffic" {
  name   = "Minecraft Server Security Group"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow All TCP"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow All UDP"
    from_port   = 25565
    to_port     = 25565
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound for updating the instance"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###############################
##------INTERNET-GATEWAY-------
###############################

resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

