
# Apply terraform config to create Kubernetes Cluster
# NOTE
#  1. $ prefixed lines are command lines  
#  2. Command output wherever helpful is shown inside {}

# Make sure to be inside the repo folder downloaded prior (terraform-create-eks-k8s-cluster)
$ pwd
{
/tmp/terraform-create-eks-k8s-cluster
}

# Initialize terraform
$ terraform init
{
Initializing modules...
- module_eks in module-eks
- module_vpc in module-vpc
Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 3.14.1 for module_vpc.vpc...
- module_vpc.vpc in .terraform/modules/module_vpc.vpc

...
Terraform has been successfully initialized!
...
}

# Review terraform execution and resource creation plan
$ terraform plan -out plan.out
{
Terraform will perform the following actions:
...
Saved the plan to: plan.out

To perform exactly these actions, run the following command to apply:
    terraform apply "plan.out"
}

# Apply to creates or updates infrastructure according to Terraform configuration
# Just 'terraform apply' or 'terraform apply -auto-approve' is fine as well, it will build the plan and apply
$ terraform apply "plan.out"
{
...
Apply complete! Resources: 28 added, 0 changed, 0 destroyed.

Outputs:

cluster_endpoint = "https://5FE92EAMANGLEDA12E8DB2B7.sk1.us-east-1.eks.amazonaws.com"
cluster_name = "jdl-eks-cluster"

}
