## Create AKS cluster with bash

```
# Set variabels

myResourceGroup="aksrg"
echo $myResourceGroup 

myAKSCluster="mycluster"
echo $myAKSCluster

# Create Resource Group
az group create --name $myResourceGroup --location uksouth

# List Resource Group
az group list --output table

# Create cluster
az aks create \
  --resource-group $myResourceGroup \
  --name $myAKSCluster \
  --enable-managed-identity \
  --node-count 1 \
  --generate-ssh-keys
  --node-count 1 \
  --node-vm-size "Standard_Standard_D2s_v3" \
  --load-balancer-sku basic

# List all clusters
az aks list --output table

# Login to AKS
az aks get-credentials -g $myResourceGroup -n $myAKSCluster
# Or
az aks get-credentials -g aksrg -n mycluster

```

## Delete 
```
az group delete --name $myResourceGroup --yes --no-wait
```
````
