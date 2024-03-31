# How to bring a custom domain to AKS - connect it with AKS - Install Lets Encrypt and use ingress control to route

## What is a domain
A domain is a unique name in the domain name system, for example, “contoso.com”.

## What is Azure DNS zone
It allows you to create DNS records on your domain for A record, came, MX records etc.
This is your kind of domain control panel.

## What is Kubernetes ExternalDNS service
ExternalDNS is an addon which synchronizes exposed Kubernetes Services and Ingresses with DNS providers.
For example in our case, when we create an ingress record using a domain name, a DNS entry is automatically created inside Azure DNS Zone.

## How ExternalDNS can make changes in Azure DNS zones
External DNS is an addon which runs as a pod inside the Kubernetes cluster. You create a [Azure managed service identity] and connect to Azure DNS zones and your Kubernetes cluster.

> [!Important]
> External-DNS needs permissions to Azure DNS to modify (Add, Update, Delete DNS Record Sets)
>
> We can provide permissions to External-DNS pod in two ways in Azure
>
> * Using Azure Service Principal
> * Using Azure Managed Service Identity (MSI)

> [!Note]
> We are going to use MSI for providing necessary permissions here which is the latest and greatest in Azure as of today.
>
## Step 1: Install Cluster and AGIC using the previous lecture

## Step 2: Create DNS Zones
Here you will bring your domain to Azure.

* Go to Service -> DNS Zones
* Subscription: Paid-Subscription (You need to have a paid subscription for this)
* Resource Group: **Domains**
* Name: 123door.co.uk
* Resource Group Location: UK South
* Click on Review + Create

## Step 3: Make a note of Azure Nameservers
Go to Services -> DNS Zones -> 123door.co.uk
Make a note of Nameservers
```
Name server 1: ns1-35.azure-dns.com.
Name server 2: ns2-35.azure-dns.net.
Name server 3: ns3-35.azure-dns.org.
Name server 4: ns4-35.azure-dns.info.

```

## Step 4: Go to your registrar and update name servers.
Verify before updation
```
nslookup -type=SOA 123door.co.uk
nslookup -type=NS 123door.co.uk
```

## Step 5: Create MSI - Managed Service Identity for External DNS to access Azure DNS Zones
###Create Managed Service Identity (MSI)
* Go to All Services -> Managed Identities -> Add
* Resource Name: **aks-externaldns-access-to-dnszones**
* Subscription: Pay-as-you-go
* Resource group: **aksrg**
* Location: UK South
* Click on Create
  
### Add Azure Role Assignment in MSI
> [!Important]
> Here we connect this [Managed Identity] to our Domains [DNS Zone] resource group.

* Open MSI -> **aks-externaldns-access-to-dnszones**
* Click on Azure Role Assignments -> Add role assignment
* Scope: Resource Group
* Subscription: Pay-as-you-go or Free trial
* Resource group: **Domains**
* Role: Contributor

> [!Note]
> **Go to Overview -> Make a note of **Client ID"**

### Associate MSI in AKS Cluster VMSS
* Go to All Services -> Virtual Machine Scale Sets (VMSS) -> Open demo related VMSS (aks-agentpool-27193923-vmss)
* Go to Security -> Identity -> User assigned -> Add -> **aks-externaldns-access-to-dnszones**


## Step 6: Create ExternalDNS required files
### Create azure.json file
> [!Note]
> azure.json will be used to create a secret for example:
> 
> kubectl create secret generic **azure-config-file** --from-file=**azure.json**
> 
> Also, this secret will then be mounted with external-dns yaml file
```
      volumes:
        - name: azure-config-file
          secret:
            secretName: azure-config-file
```
#### Gather Information Required for azure.json file
```
# To get Azure Tenant ID
az account show --query "tenantId"

# To get Azure Subscription ID
az account show --query "id"
```
#### Create azure.json file
```
{
  "tenantId": " tenantId here ",
  "subscriptionId": " subscriptionId here ",
  "resourceGroup": "Domains", 
  "useManagedIdentityExtension": true,
  "userAssignedIdentityID": " Managed Identity Client ID here " # Managed Service Identity client id noted in the previous step
}
```
### Create a Secret 'azure-config-file' to mount at external-dns.yml so External DNS can access and modify DNS Zone entries
```
kubectl create secret generic azure-config-file --from-file=azure.json

# List Secrets
kubectl get secrets
```

#### Create external-dns.yml
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: external-dns
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: external-dns
rules:
  - apiGroups: [""]
    resources: ["services","endpoints","pods", "nodes"]
    verbs: ["get","watch","list"]
  - apiGroups: ["extensions","networking.k8s.io"]
    resources: ["ingresses"]
    verbs: ["get","watch","list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: external-dns-viewer
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: external-dns
subjects:
  - kind: ServiceAccount
    name: external-dns
    namespace: default
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: external-dns
spec:
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: external-dns
  template:
    metadata:
      labels:
        app: external-dns
    spec:
      serviceAccountName: external-dns
      containers:
        - name: external-dns
          image: registry.k8s.io/external-dns/external-dns:v0.14.0
          args:
            - --source=service
            - --source=ingress
            #- --domain-filter=example.com # (optional) limit to only example.com domains; change to match the zone created above.
            - --provider=azure
            #- --azure-resource-group=MyDnsResourceGroup # (optional) use the DNS zones from the tutorial's resource group
            - --txt-prefix=externaldns-
          volumeMounts:
            - name: azure-config-file
              mountPath: /etc/kubernetes
              readOnly: true
      volumes:
        - name: azure-config-file
          secret:
            secretName: azure-config-file
```
