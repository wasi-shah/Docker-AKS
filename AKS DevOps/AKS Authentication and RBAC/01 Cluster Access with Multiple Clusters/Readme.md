# Understand how to access multiple Azure Kubernetes AKS Clusters using kubectl

```

# View Cluster Information
kubectl cluster-info


# View config
kubectl config view

# View current config
kubectl config current-context

# Set which config to sue if multiple config available
kubectl config use-context YOUR-CONFIG-NAME

# Configure AKSDEMO3 & 4 Cluster Access for kubectl
az aks get-credentials --resource-group aks-rg3 --name aksdemo3

# Switch Context
kubectl config use-context aksdemo3

```