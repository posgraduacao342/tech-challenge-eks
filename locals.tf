locals {
  name   = "tech-challenge-cluster"
  region = "us-east-1"

  tags = {
    name = local.name
  }
}