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

> [!important]
> Any pod deployment into the VMSS can now access the DNS zone and update dns entries.


## Step 6: Create ExternalDNS required files

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

## Step 7: Deploy Application and Test

### Deploy Application
```
ls custom-domain/
# Output
# azure.json
# external-dns.yml
# pods-services-and-ingress-domain-based.yaml

# Deploy Application, Cluster IP Service and Ingress 
kubectl apply -f custom-domain/.

# Check objects
kubectl get po,svc,ingress,sa,secret

# Describe the ingress to check for the backend ingress rules and context paths

Kubectl describe ingress

Name:             fanout-demo
Labels:           <none>
Namespace:        default
Address:          51.143.179.172
Ingress Class:    azure-application-gateway
Default backend:  <default>
Rules:
  Host           Path  Backends
  ----           ----  --------
  123door.co.uk  
                 /app1   app1-service:80 (10.224.0.218:80)
                 /       mycustomnginx-service:80 (10.224.0.185:80)
Annotations:     appgw.ingress.kubernetes.io/backend-path-prefix: /
Events:          <none>

```
> [!Important]
>  The above ingress confirms our definition which is 
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: fanout-demo
  annotations:
    appgw.ingress.kubernetes.io/backend-path-prefix: "/"
spec:
  ingressClassName: azure-application-gateway
  rules:
  - host: 123door.co.uk  
  - http:
      paths:
        - path: /app1
          pathType: ImplementationSpecific
          backend:
            service:
              name: app1-service
              port: 
                number: 80
          - path: /
          pathType: ImplementationSpecific
          backend:
            service:
              name: mycustomnginx-service
              port: 
                number: 80       
```

### Check external-dns pod for possible errors
* Wait for 3 to 5 minutes for Record Set update in DNZ Zones
```
kubectl describe  pod $(kubectl get po | egrep -o 'external-dns[A-Za-z0-9-]+')
kubectl logs -f $(kubectl get po | egrep -o 'external-dns[A-Za-z0-9-]+')
kubectl events  $(kubectl get po | egrep -o 'external-dns[A-Za-z0-9-]+')
```

### Successful Log entries should look like below
```
time="2024-03-31T12:57:03Z" level=info msg="Instantiating new Kubernetes client"
time="2024-03-31T12:57:03Z" level=info msg="Using inCluster-config based on serviceaccount-token"
time="2024-03-31T12:57:03Z" level=info msg="Created Kubernetes client https://10.0.0.1:443"
time="2024-03-31T12:57:03Z" level=info msg="Using managed identity extension to retrieve access token for Azure API."
time="2024-03-31T12:57:04Z" level=info msg="Ignoring changes to 'externaldns-123door.co.uk' because a suitable Azure DNS zone was not found."
time="2024-03-31T12:57:04Z" level=info msg="Ignoring changes to 'externaldns-a-123door.co.uk' because a suitable Azure DNS zone was not found."
time="2024-03-31T12:57:04Z" level=info msg="Updating A record named '@' to '51.143.179.172' for Azure DNS zone '123door.co.uk'."
```

### Check A record DNS entry
The ingress IP should be created as A record inside the domain DNS records

```
az network dns record-set a list -g Domains -z 123door.co.uk

nslookup 123door.co.uk

wasi [ ~ ]$ nslookup 123door.co.uk
Server:         168.63.129.16
Address:        168.63.129.16#53

Non-authoritative answer:
Name:   123door.co.uk
Address: 51.143.179.172

```

### Recreate pods if necessary by deleting the pod
```
kubectl delete pod  $(kubectl get po | egrep -o 'external-dns[A-Za-z0-9-]+')
```

### Describe ingress to check the endpoints

```
Kubectl describe ingress

Name:             fanout-demo
Labels:           <none>
Namespace:        default
Address:          51.143.179.172
Ingress Class:    azure-application-gateway
Default backend:  <default>
Rules:
  Host           Path  Backends
  ----           ----  --------
  123door.co.uk  
                 /app1   app1-service:80 (10.224.0.218:80)
                 /       mycustomnginx-service:80 (10.224.0.185:80)
Annotations:     appgw.ingress.kubernetes.io/backend-path-prefix: /
Events:          <none>

```

### Access Application and Test
```
# Access Application
http://123door.co.uk/
http://123door.co.uk/app1
```

## Clean Up!
```
kubectl delete -f custom-domain/.
kubectl delete secret azure-config-file
```
