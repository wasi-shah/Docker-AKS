## Create AKS cluster with bash

```
myResourceGroup="aksrg"
echo $myResourceGroup 

myAKSCluster="mycluster"
echo $myAKSCluster


az group create --name $myResourceGroup --location uksouth
az group list --output table


az aks create \
  --resource-group $myResourceGroup \
  --name $myAKSCluster \
  --enable-managed-identity \
  --node-count 1 \
  --generate-ssh-keys
  --node-count 1 \
  --node-vm-size "Standard_Standard_D2s_v3" \
  --load-balancer-sku basic

```

## Delete 
```
az group delete --name $myResourceGroup --yes --no-wait
```
````
