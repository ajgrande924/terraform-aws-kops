// Used to allow web access to the k8s API ELB
module "open_kube_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.1.0"

  name        = "open-kube-sg"
  description = "security group that allows ssh, http(s) and all egress traffic"

  vpc_id              = module.dev_vpc.vpc_id
  ingress_cidr_blocks = ["10.0.0.0/26"]
  ingress_with_cidr_blocks = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = "10.0.0.0/32"
    },
    {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = "10.0.0.0/32"
    },
  ]

  egress_cidr_blocks = ["10.0.0.0/26"]
  egress_with_cidr_blocks = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Owner       = var.fellow_name
    Environment = "dev"
    Terraform   = "true"
  }
}
