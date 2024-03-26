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
