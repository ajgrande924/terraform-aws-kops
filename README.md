# terraform-aws-kops
> deploy a kubernetes cluster using terraform aws resources and kops 

## requirements

  - jq
  - kubectl
  - k8 @ 1.13.10
  - kops @ 1.13.0
  - terraform @ >= 0.12

## usage

  - create s3 bucket for terraform remote state: `tf-state-924` (us-west-2)
  - setup route53 for domain: `practicedevops.org`

Add aws credentials to `.profile` or `.zprofile`:
```sh
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXX 
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXX
```

Using `terraform@>=0.12`, to provision the infrastructure:
```sh
# provision vpc
cd terraform
terraform init
terraform plan
terraform apply
cd ..

# provision cluster
cd kops
./gen_cluster.sh
terraform init
terrafor 0.12upgrade
terraform plan
terraform apply

# destroy (cluster -> vpc)
cd kops
terraform destroy
./cleanup_cluster.sh
cd ../terraform
terraform destroy
cd ..
./clean
```

## todo

  - setup `kubectl` to communicate with `sandbox.practicedevops.xyz`
  - update `cluster_template.yml` to deploy flask / data pipeline
  - update `cluster_template.yml` to deploy monitoring tool
  - update `cluster_template.yml` to inject chaos

## references

  - Blog: [Kubernetes on AWS: Kops & Terraform](https://zerotoprod.com/posts/k8s-on-aws-kops-terraform/)
  - Medium: [Deploying Kubernetes clusters with kops and Terraform](https://medium.com/bench-engineering/deploying-kubernetes-clusters-with-kops-and-terraform-832b89250e8e)
  - Github: [Deploying Kubernetes clusters with kops and Terraform](https://github.com/BenchLabs/blog-k8s-kops-terraform)
  - Github: [Kops Cluster Templating](https://github.com/kubernetes/kops/blob/master/docs/cluster_template.md)
  - Github: [terraform-aws-foundation](https://github.com/fpco/terraform-aws-foundation/tree/master/examples/kops-with-vpc)
  - Blog: [Kops vs. EKS](https://caylent.com/kops-vs-eks-a-comparison-guide)
