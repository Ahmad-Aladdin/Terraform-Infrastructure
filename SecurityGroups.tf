resource "aws_security_group" "public-Security-Group" {
  name   = "allow-ssh"
  vpc_id = module.network.myVpc_id
  ingress {
    description = "allow-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.workSpace}-public-SG"
  }
}


resource "aws_security_group" "private-Security-Group" {
  name   = "custom-ports"
  vpc_id = module.network.myVpc_id
  ingress {
    description = "allow-ssh-port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
  }
  ingress {
    description = "allow-port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.workSpace}-private-SG"
  }
}


resource "aws_security_group" "security-db" {
  name   = "security-db"
  vpc_id = module.network.myVpc_id

  ingress {
    description = "all from vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [module.network.vpc_cider]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.workSpace}-security-db"
  }
}