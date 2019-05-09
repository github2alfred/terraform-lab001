# Demonstrate AKS-Engine and Terraform

This blueprint is developed for educational purposes.

## Pre-requisites

```
Install aks-engine, kubectl, terraform

This blueprint must be running in one of the following environments:
    Linux (Centos),
    Windows Linux Subsystem (tested on Ubuntu),
    MacOS,
    Azure BASH console

It is not working on Windows command lines or Powershell
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
# adjust the region and the cluster dns prefix you have deployed part of the terraform apply step
export KUBECONFIG=./_output/[cluster_dns_prefix]]/kubeconfig/kubeconfig.[region].json
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
