resource "aws_instance" "bastion" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  key_name               = "public_key_pair"
  vpc_security_group_ids = [aws_security_group.public-Security-Group.id]
  subnet_id              = aws_subnet.sub-pub-1a.id
  associate_public_ip_address = true
  tags = {
    Name = "public-1a"
  }
}


resource "aws_instance" "application" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  key_name               = "public_key_pair"
  vpc_security_group_ids = [aws_security_group.private-Security-Group.id]
  subnet_id              = aws_subnet.sub-pri-1a.id
  associate_public_ip_address = false
  tags = {
    Name = "private-1a"
  }
}