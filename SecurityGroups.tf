resource "aws_security_group" "public-Security-Group" {
  name   = "allow-ssh"
  vpc_id = aws_vpc.myVPC.id
  ingress {
    description = "allow-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "public-SG"
  }
}


resource "aws_security_group" "private-Security-Group" {
  name   = "custom-ports"
  vpc_id = aws_vpc.myVPC.id
  ingress {
    description = "allow-ssh-port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = [aws_vpc.myVPC.cidr_block]
  }
  ingress {
    description = "allow-port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks  = [aws_vpc.myVPC.cidr_block]
  }
  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "private-SG"
  }
}