module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.0"

  cluster_name                   = local.name
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = var.vpc_id
  subnet_ids = data.aws_subnets.this.ids
  #   control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.large"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    tech-challenge-ng = {
      min_size     = 1
      max_size     = 8
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  tags = local.tags
}
