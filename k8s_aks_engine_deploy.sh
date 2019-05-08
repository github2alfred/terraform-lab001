#!/bin/bash

dns_suffix=$1
resource_group_name=$2

aks-engine generate ./_run/${dns_suffix}.json

az group deployment create --name ${dns_suffix} \
    --resource-group ${resource_group_name} \
    --template-file ./_output/${dns_suffix}/azuredeploy.json \
    --parameters ./_output/${dns_suffix}/azuredeploy.parameters.json