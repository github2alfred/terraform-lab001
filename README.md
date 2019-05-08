# Demonstrate AKS-Engine and Terraform

## pre-requisites

```
Install aks-engine, kubectl, terraform
```
## Deploy
```
terraform init

terraform plan

terraform apply
```

## Set the kubeconfig
```
export KUBECONFIG=~/git/github.com/laurentlesle/azure_terraform_blueprint_aks_engine/_output/aeryfbls6q8jkvfmtoxk5u4pnbv372zo/kubeconfig/kubeconfig.southeastasia.json
```

## Test the cluster is working
```
kubectl cluster-info

kubectl get nodes -o wide
```