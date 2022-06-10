resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  key_name                    = "publlic_key_pair"
  vpc_security_group_ids      = [aws_security_group.public-Security-Group.id]
  subnet_id                   = module.network.public_subnet_1a-ID
  associate_public_ip_address = true
  tags = {
    Name = "public-1a"
  }
}


resource "aws_instance" "application" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  key_name                    = "publlic_key_pair"
  vpc_security_group_ids      = [aws_security_group.private-Security-Group.id]
  subnet_id                   = module.network.private_subnet_1a-ID
  associate_public_ip_address = false
  tags = {
    Name = "private-1a"
  }
}