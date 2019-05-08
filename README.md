# Demonstrate AKS-Engine and Terraform

## pre-requisites

```
Install aks-engine, kubectl, terraform
```
## Deploy
```
terraform init

mkdir _run

terraform plan

terraform apply
```

## Set the kubeconfig 
```
# adjust the region and the dns prefix you deployed the cluster
export KUBECONFIG=./_output/[dns_prefix]]/kubeconfig/kubeconfig.[region].json
```

## Test the cluster is working
```
kubectl cluster-info

kubectl get nodes -o wide
```

## Deploy a pod and connect to it
```
kubectl run busybox --generator=run-pod/v1 --image=busybox -it -l agentpool=microservice 
```
