provider "aws" {
  region  = var.aws_region
  version = "~> 2.23.0"
}

terraform {
  backend "s3" {
    bucket = "tf-state-924"
    key    = "terraform/kops-example"
    region = "us-west-2"
  }
}

locals {
  azs                    = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  environment            = "dev"
  kops_state_bucket_name = "tf-state-kops-924"
  kubernetes_cluster_name = "k8s-dev0.practicedevops.org"
  ingress_ips             = ["10.0.0.100/32", "10.0.0.101/32"]
  vpc_name                = "${local.environment}-vpc"

  tags = {
    environment = "${local.environment}"
    terraform   = true
  }
}

data "aws_region" "current" {}
