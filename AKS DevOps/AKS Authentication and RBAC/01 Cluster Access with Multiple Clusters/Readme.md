# Understand how to access multiple Azure Kubernetes AKS Clusters using kubectl
Understand kubectl config command
- kubectl config view
- kubectl config current-context
- kubectl config use-context



# View kubeconfig
kubectl config view

# Configure AKSDEMO3 & 4 Cluster Access for kubectl
az aks get-credentials --resource-group aks-rg3 --name aksdemo3

# View kubeconfig
kubectl config view

# View Cluster Information
kubectl cluster-info

# View the current context for kubectl
kubectl config current-context
```