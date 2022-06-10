resource "aws_db_subnet_group" "subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [module.network.private_subnet_1a-ID, module.network.private_subnet_1b-ID]

  tags = {
    Name = "My-Database subnet group"
  }
}

resource "aws_elasticache_subnet_group" "group-cash" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [module.network.private_subnet_1a-ID , module.network.private_subnet_1b-ID] 
}