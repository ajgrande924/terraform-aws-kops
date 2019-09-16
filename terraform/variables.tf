variable "aws_region" {
  description = "AWS region to launch servers. For NY,BOS,VA use us-east-1. For SF use us-west-2"
  default     = "us-west-2"
}

variable "keypair_name" {
  description = "The name of your pre-made key-pair in Amazon (e.g. david-IAM-keypair)"
}

variable "fellow_name" {
  description = "The name that will be tagged on your resources."
}

variable "amis" {
 type = map (string)
  default = {
    "us-east-1" = "ami-00290d66f0da25f73"
    "us-west-2" = "ami-03286c54f2490b96e"
  }
}

variable "cluster_name" {
  description = "The name for your instances in your cluster"
  default     = "cluster"
}
