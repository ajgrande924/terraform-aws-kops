# terraform-kops
> deploy a kubernetes cluster using terraform aws resources and kops. 

## requirements

  - jq
  - kops @ 1.13.0
  - kubectl
  - terraform @ >= 0.12

## usage

  - create s3 bucket for terraform remote state: `tf-state-924` (us-west-2)
  - setup route53 for domain: `practicedevops.org`

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
cd ../terraform
terraform destroy
cd ..
./clean
```

## todo

  - setup `kubectl` to communicate with `api.k8s-dev0.practicedevops.org`
  - update `cluster_template.yml` to deploy flask / data pipeline
  - update `cluster_template.yml` to deploy monitoring tool
  - update `cluster_template.yml` to inject chaos

## references

  - Blog: [Kubernetes on AWS: Kops & Terraform](https://zerotoprod.com/posts/k8s-on-aws-kops-terraform/)
  - Medium: [Deploying Kubernetes clusters with kops and Terraform](https://medium.com/bench-engineering/deploying-kubernetes-clusters-with-kops-and-terraform-832b89250e8e)
  - Github: [Deploying Kubernetes clusters with kops and Terraform](https://github.com/BenchLabs/blog-k8s-kops-terraform)
  - Github: [Kops Cluster Templating](https://github.com/kubernetes/kops/blob/master/docs/cluster_template.md)
  - Blog: [Kops vs. EKS](https://caylent.com/kops-vs-eks-a-comparison-guide)
