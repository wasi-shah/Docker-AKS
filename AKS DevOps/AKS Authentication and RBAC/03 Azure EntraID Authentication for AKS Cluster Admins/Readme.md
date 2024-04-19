
# Using RBAC with Azure Entra ID in AKS

AKS does not allow you to configure APi Server pod directly because AKS is a managed service.

You you nee to run CLI commands to or use GUI portal to enable authrisation mode in AKS

Enable RBAC with Azure Entra ID in AKS


## Step 1: Check if RBAC is already enabled

Before you enable - check the auth mode set in cluster

```
kubectl api-versions
kubectl cluster-info dump | grep authorization-mode
Output
blank


# The best way is to check the cluster's resource details at resources.azure.com. If you can spot "enableRBAC": true, your cluster has RBAC enabled. 
az resource show -g aksrg -n mycluster --resource-type Microsoft.ContainerService/ManagedClusters --query properties.enableRBAC
Output
true

# You can check this by executing the command kubectl api-versions; if RBAC is enabled you should see the API version .rbac.authorization.k8s.io/v1.
kubectl api-versions | grep rbac
Output
rbac.authorization.k8s.io/v1
```

Ste 2: Enable Azure managed identity authentication for Kubernetes clusters

Create an AKS cluster and enable administration access for your Microsoft Entra group using the az aks create command.
```
az aks create -g myResourceGroup -n myManagedCluster --enable-aad --aad-admin-group-object-ids <id> [--aad-tenant-id <id>]

# Use an existing cluster
az aks update -g MyResourceGroup -n myManagedCluster --enable-aad --aad-admin-group-object-ids <id-1>,<id-2> [--aad-tenant-id <id>]
```

Step 3: Enable using GUI / Allow users to become KS admin
```
Go to All Services -> Kubernetes Services -> aksdemo3 -> Settings -> Configuration
Authentication and Authorization
Choose Azure AD authentication with Kubernetes RBAC
Choose admin group
Click on SAVE
```

Step 4: Re-login with different user to test kubectl
```
# Overwrite kubectl credentials 
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --overwrite-existing

# View kubectl config (Observe aksdemo3 user)
kubectl config view 

# List Nodes
kubectl get nodes
URL: https://microsoft.com/devicelogin
It will force to login


# How to bypass or Override AD Authentication and use k8s admin?
If we have issues with AD Users or Groups and want to override that we can use --admin to override and directly connect to AKS Cluster
# Template
az aks get-credentials --resource-group myResourceGroup --name myManagedCluster --admin

# Replace RG and Cluster Name
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --admin

# List Nodes
kubectl get nodes

# List Pods
kubectl get pods -n kube-system

```

