locals {
  name   = "tech-challenge-cluster"
  region = "us-east-2"

  tags = {
    name = local.name
  }
}