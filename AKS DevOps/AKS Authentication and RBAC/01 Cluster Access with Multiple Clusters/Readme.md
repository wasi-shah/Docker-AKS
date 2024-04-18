# Understand how to access multiple Azure Kubernetes AKS Clusters using kubectl

```

# View Cluster Information
kubectl cluster-info
---
Kubernetes control plane is running at https://mycluster-aksrg-e3b7fa-bjq5hwmx.hcp.uksouth.azmk8s.io:443
CoreDNS is running at https://mycluster-aksrg-e3b7fa-bjq5hwmx.hcp.uksouth.azmk8s.io:443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://mycluster-aksrg-e3b7fa-bjq5hwmx.hcp.uksouth.azmk8s.io:443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

---

# Check the config 
cat /home/hamna/.kube/config



# View config
kubectl config view
---
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://mycluster-aksrg-e3b7fa-bjq5hwmx.hcp.uksouth.azmk8s.io:443
  name: mycluster
contexts:
- context:
    cluster: mycluster
    user: clusterUser_aksrg_mycluster
  name: mycluster
current-context: mycluster
kind: Config
preferences: {}
users:
- name: clusterUser_aksrg_mycluster
  user:
    client-certificate-data: DATA+OMITTED
    client-key-data: DATA+OMITTED
    token: REDACTED
---


# View current config
kubectl config current-context
Output: 
mycluster


# Set which config to sue if multiple config available
kubectl config use-context YOUR-CONFIG-NAME

# Configure AKSDEMO3 & 4 Cluster Access for kubectl
az aks get-credentials --resource-group aks-rg3 --name aksdemo3

# Switch Context
kubectl config use-context aksdemo3



```