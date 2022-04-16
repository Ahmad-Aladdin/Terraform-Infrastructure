terraform {
  backend "s3" {
    bucket         = "source-bucket-ahmed"
    key            = "terraformStat/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Lock"
  }
}
