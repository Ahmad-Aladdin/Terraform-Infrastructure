resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.myVPC.id
  tags = {
    Name = "internet-igw"
  }
}


resource "aws_subnet" "sub-pub-1a" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "sub-pri-1a" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-1a"
  }
}


resource "aws_subnet" "sub-pub-1b" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-1b"
  }
}

resource "aws_subnet" "sub-pri-1b" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-1b"
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    "Name" = "Route-Table"
  }
}


resource "aws_route_table_association" "Route_Table-1" {
  subnet_id      = aws_subnet.sub-pub-1a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "Route_Table-2" {
  subnet_id      = aws_subnet.sub-pub-1b.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_eip" "elasticIP-1" {
  depends_on = [aws_internet_gateway.gateway]
  vpc        = true
}

resource "aws_eip" "elasticIP-2" {
  depends_on = [aws_internet_gateway.gateway]
  vpc        = true
}

resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.elasticIP-1.id
  subnet_id     = aws_subnet.sub-pub-1a.id

  tags = {
    Name = "NAT-GW-1a"
  }
}


resource "aws_nat_gateway" "nat-gateway-2" {
  allocation_id = aws_eip.elasticIP-2.id
  subnet_id     = aws_subnet.sub-pub-1b.id

  tags = {
    Name = "NAT-GW-1b"
  }
}
