# Set Kubernetes Cluster Context and Test Connectivity
# NOTE
#  1. $ prefixed lines are command lines  
#  2. Command output wherever helpful is shown inside {}

# Set Kubernetes Cluster Context to our cluster
$ aws --region $(terraform output -raw region) eks update-kubeconfig --name $(terraform output -raw cluster_name)
{
Add (or Updated) context arn:aws:eks:us-east-1:123454829664:cluster/jdl-eks-cluster in ~/.kube/config
}

# Test Cluster Context after setting
$ kubectl config current-context
{
arn:aws:eks:us-east-1:123454829664:cluster/jdl-eks-cluster
}

# Connect to cluster to make sure it is up and running (check namespace and nodes)
$ kubectl get ns
{
NAME              STATUS   AGE
default           Active   26m
kube-node-lease   Active   26m
kube-public       Active   26m
kube-system       Active   26m
}

$ kubectl get nodes
{
NAME                        STATUS   ROLES    AGE   VERSION
ip-10-0-1-97.ec2.internal   Ready    <none>   21m   v1.22.9-eks-810597c
ip-10-0-2-5.ec2.internal    Ready    <none>   21m   v1.22.9-eks-810597c
}

# All good if the kubectl commands run and show the output like above.