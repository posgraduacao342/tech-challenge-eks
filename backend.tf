terraform {
  backend "s3" {
    bucket = "pos-graduacao-fiap-terraform-state"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
