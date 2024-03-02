terraform {
  backend "s3" {
    bucket = "pos-graduacao-fiap-terraform-state-us-east1"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}