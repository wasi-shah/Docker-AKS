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
# Step 1: Install Cluster and AGIC using the previous lecture

# Step 2: Create DNS Zones
Here you will bring your domain to Azure.

* Go to Service -> DNS Zones
* Subscription: StackSimplify-Paid-Subscription (You need to have a paid subscription for this)
* Resource Group: Domains
* Name: kubeoncloud.com
* Resource Group Location: UK South
* Click on Review + Create

# Step 3: Make a note of Azure Nameservers
Go to Services -> DNS Zones -> 123door.co.uk
Make a note of Nameservers
```
Name server 1: ns1-35.azure-dns.com.
Name server 2: ns2-35.azure-dns.net.
Name server 3: ns3-35.azure-dns.org.
Name server 4: ns4-35.azure-dns.info.

```


