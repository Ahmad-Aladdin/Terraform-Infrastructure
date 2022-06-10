terraform {
  backend "s3" {
    bucket         = "hmada-jenkins-lul"
    key            = "terraformStat/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Terraform-jenkins"
  }
}
