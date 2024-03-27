# What is Ingress?
Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.
Ingress may be configured to give 
* Services externally-reachable URLs
* Load balance traffic
* Terminate SSL / TLS
* And offer name-based virtual hosting.


# What is an Ingress Controller?
For the Ingress resource to work, the cluster must have an ingress controller running.
An Ingress controller is responsible for fulfilling the Ingress, usually with a load balancer, though it may also configure your edge router or additional frontends to help handle the traffic.
> [!warning]
> Unlike other types of controllers which run as part of the kube-controller-manager binary, Ingress controllers are not started automatically with a cluster.

**Kubernetes supports following major ingress controller**
* AWS Load Balancer Controller
* Ingress NGINX Controller
* GCE (Google)
* **AKS Application Gateway Ingress Controller [AGIC]** is an ingress controller that configures the **Azure Application Gateway**.
* others

## What is AKS Application Gateway Ingress Controller [AGIC]
The Application Gateway Ingress Controller (AGIC) is a Kubernetes application, which makes it possible for Azure Kubernetes Service (AKS) customers to leverage Azure's native Application Gateway L7 load-balancer to expose cloud software to the Internet.

> [!note]
> The AGIC deployed as a pod in the customer's AKS cluster.

## Benefits Application Gateway Ingress Controller
* You can use a single IP to point to your different applications inside the cluster.
* AGIC helps eliminate the need to have another load balancer/public IP address in front of the AKS cluster and avoids multiple hops in your datapath before requests reach the AKS cluster.
> [!Note]
> AGIC is configured via the Kubernetes Ingress resource, along with Service and Deployments/Pods. It provides many features, using Azure’s native Application Gateway L7 load balancer. To name a few:
> 
> * URL routing
> 
> * Cookie-based affinity
> 
> * TLS termination
> 
> * End-to-end TLS
> 
> * Support for public, private, and hybrid websites
> 
> * Integrated web application firewall

## How to install Application Gateway Ingress Controller
There are two ways to deploy AGIC for your AKS cluster. The first way is through Helm; the second is through AKS as an add-on
* Helm
  - Difficult to install
  - Support both Greenfield Deployment and Brownfield Deployment
* AKS as an add-on
  - Easy to install
  - The add-on is also a fully managed service, which provides added benefits such as automatic updates and increased support.
  - Since AGIC add-on is a managed service, customers are automatically updated to the latest version of AGIC add-on, unlike AGIC deployed through Helm where the customer must manually update AGIC.
  - Support both Greenfield Deployment and Brownfield Deployment

> [!Important]
> **Greenfield Deployment**
> 
> Installing AGIC, AKS, and Application Gateway on blank-slate infrastructure.

> [!Important]
> **Brownfield Deployment**
> 
> Install AGIC on an AKS cluster with an existing Application Gateway.
> 

# Install Application Gateway Ingress Controller (Addon)
Install AGIC add-on to expose your Kubernetes application in an existing AKS cluster through an existing application gateway deployed in separate virtual networks. 

> [!important]
> It's a Brownfield Deployment because technically when you are installing an AGIC on an existing Application gateway that exists in a different vNet.


 
## Step 1: Manually Create Resource Group aksrg
## Step 2: Manually Create Cluster mycluster 
Create a cluster manually if you are on a free trial

> [!Note]
> This cluster does not have any Application Gateway at the moment so it's a **Brownfield Deployment**


> [!important]
> **simulate having an existing application gateway**
> 
> You'll now deploy a new application gateway, to simulate having an existing application gateway that you want to use to load balance traffic to your AKS cluster, myCluster.
> 
> The name of the application gateway will be myApplicationGateway, but you'll need to first create a public IP resource, named myPublicIp, and a new virtual network called myVnet with address space 10.0.0.0/16, and a subnet with address space 10.0.0.0/24 called mySubnet, and deploy your application gateway in mySubnet using myPublicIp.

> [!caution]
> When you use an AKS cluster and application gateway in separate virtual networks, the address spaces of the two virtual networks must not overlap. The default address space that an AKS cluster deploys in is 10.224.0.0/12.


## Step 3: Create a new IP [myPublicIp] in [aksrg]
```
az network public-ip create -n myPublicIp -g aksrg --allocation-method Static --sku Standard
```


## Step 4: Create vnet called myVnet in [aksrg]	Resource Group
```
az network vnet create -n myVnet -g aksrg --address-prefix 10.0.0.0/16 --subnet-name mySubnet --subnet-prefix 10.0.0.0/24 
```


## Step 5: Create an Application Gateway called myApplicationGateway in [aksrg] Resource Group

```
az network application-gateway create -n myApplicationGateway -g aksrg --sku Standard_v2 --public-ip-address myPublicIp --vnet-name myVnet --subnet mySubnet --priority 100
```


## Step 6: Create Managed Identity ingressapplicationgateway-mycluster in [Infrastructure Group]
> [!Important]
> * The [az aks enable-addons] create deployment inside AKS Cluster [mycluster]
> * The deployment name is ingress-appgw-deployment inside AKS Cluster [mycluster]
> * This deployment is in 'kube-system' namespace
> * Azure application gateway ingress controller AGIC runs as a pod so if you run get pods in kube-system ns you will pods
> * Kubectl get pods -n kube-system
> * If you run you will see the ingress has an external IP

> [!note]
> This block installs the Application Gateway Ingress Controller (Addon)

> [!note]
> Enable the AGIC add-on in the existing AKS cluster through Azure CLI


```
# First find the Application Gateway ID 
appgwId=$(az network application-gateway show -n myApplicationGateway -g aksrg -o tsv --query "id") 
echo $appgwId
# /subscriptions/bd541b3c-91be-477e-b030-4c5f3f2530be/resourceGroups/aksrg/providers/Microsoft.Network/applicationGateways/myApplicationGateway

#Run [az aks enable-addons] to Install Application Gateway Ingress Controller (Addon)
az aks enable-addons -n myCluster -g aksrg -a ingress-appgw --appgw-id $appgwId

```

## Step 7: Configure Peer the two virtual networks together

Since you deployed the AKS cluster in its own virtual network and the Application gateway in another virtual network, you'll need to peer the two virtual networks together for traffic to flow from the Application gateway to the pods in the cluster. Peering the two virtual networks requires running the Azure CLI command two separate times, to ensure that the connection is bi-directional. The first command will create a peering connection from the Application gateway virtual network to the AKS virtual network; the second command will create a peering connection in the other direction.

> [!important]
> Since you deployed the AKS cluster in its own virtual network and the Application gateway in another virtual network, you'll need to peer the two virtual networks together for traffic to flow from the Application gateway to the pods in the cluster.


```
# Find infra resource group name
nodeResourceGroup=$(az aks show -n myCluster -g aksrg -o tsv --query "nodeResourceGroup")
echo $nodeResourceGroup
# infra-rg

# Find vNet name
aksVnetName=$(az network vnet list -g $nodeResourceGroup -o tsv --query "[0].name")
echo $aksVnetName
# aks-vnet-14560875

# Find vNetID
aksVnetId=$(az network vnet show -n $aksVnetName -g $nodeResourceGroup -o tsv --query "id")
echo $aksVnetId
# /subscriptions/bd541b3c-91be-477e-b030-4c5f3f2530be/resourceGroups/infra-rg/providers/Microsoft.Network/virtualNetworks/aks-vnet-14560875

# Create the first vnet peering 
az network vnet peering create -n AppGWtoAKSVnetPeering -g aksrg --vnet-name myVnet --remote-vnet $aksVnetId --allow-vnet-access
appGWVnetId=$(az network vnet show -n myVnet -g aksrg -o tsv --query "id")
echo $appGWVnetId
#/subscriptions/bd541b3c-91be-477e-b030-4c5f3f2530be/resourceGroups/aksrg/providers/Microsoft.Network/virtualNetworks/myVnet

# Create the second vnet peering 
az network vnet peering create -n AKStoAppGWVnetPeering -g $nodeResourceGroup --vnet-name $aksVnetName --remote-vnet $appGWVnetId --allow-vnet-access

# The above will configure two vnet peering.

```
## Step 8: Login and run app
```
az aks get-credentials -n myCluster -g aksrg

kubectl apply -f https://raw.githubusercontent.com/Azure/application-gateway-kubernetes-ingress/master/docs/examples/aspnetapp.yaml 

# pod/aspnetapp created
# service/aspnetapp created
# ingress.networking.k8s.io/aspnetapp created

# Check if Cluster IP service is created.
Kubectl get svc

# Check if the Ingress service is created 
Kubectl get ingress
# Browse the website with external IP

```
