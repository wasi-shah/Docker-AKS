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
