# Services in Kubernetes
In Kubernetes, a Service is a method for exposing a network application that is running as one or more Pods in your cluster.
> [!CAUTION]
> The IP addresses of pods are dynamic which means that if you recreate a pod and a new IP will be assigned.

> [!Notes]
> Services are virtual objects that expose the pod/resplicaset or deployment by binding them into a service name.
> This helps us to call the pod/rs/deployment by internal DNS-like calls, for example, http://my-backend-service

Kubernetes Service types allow you to specify what kind of Service you want.
The available type values and their behaviours are:

## ClusterIP (default service) (Internet to k8s cluster)
It creates a Cluster virtual IP so multiple clusters can talk to each other. Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default that is used if you don't explicitly specify a type for a Service. You can expose the Service to the public internet using an Ingress or a Gateway.

This default Service type assigns an IP address from a pool of IP addresses that your cluster has reserved for that purpose. Several of the other types for Service build on the ClusterIP type as a foundation. If you define a Service that has the .spec.clusterIP set to "None" then Kubernetes does not assign an IP address.

## NodePort (To Internet through a Worker Node)
Used to map a node port to a pod port using [selector]. The selector is used to filter the pods with some sort of criteria like app name.

Exposes the Service on each Node's IP at a static port (the NodePort). To make the node port available, Kubernetes sets up a cluster IP address, the same as if you had requested a Service of type: ClusterIP.

If you set the type field to NodePort, the Kubernetes control plane allocates a port from a range specified by --service-node-port-range flag (default: 30000-32767). Each node proxies that port (the same port number on every Node) into your Service. Your Service reports the allocated port in its .spec.ports[*].nodePort field.

Using a NodePort gives you the freedom to set up your own load-balancing solution, to configure environments that are not fully supported by Kubernetes, or even to expose one or more nodes' IP addresses directly.

## ExternalName (From Internet)
It is used to connect the pods to an external MySQL database sitting on Azure through a CNAME.

Maps the Service to the contents of the externalName field (for example, to the hostname api.foo.bar.example). The mapping configures your cluster's DNS server to return a CNAME record with that external hostname value. No proxying of any kind is set up.

type: ExternalName

Services of type ExternalName map a Service to a DNS name, not to a typical selector such as my-service or cassandra. You specify these Services with the spec.externalName parameter.
This Service definition, for example, maps the my-service Service in the prod namespace to my.database.example.com:
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: prod
spec:
  type: ExternalName
  externalName: my.database.example.com
```
## LoadBalancer (To Internet)
Exposes the Service (nodePort) externally using an external load balancer. Kubernetes does not directly offer a load balancing component; you must provide one, or you can integrate your Kubernetes cluster with a cloud provider.

type: LoadBalancer

On cloud providers which support external load balancers, setting the type field to LoadBalancer provisions a load balancer for your Service. 

The actual creation of the load balancer happens asynchronously, and information about the provisioned balancer is published in the Service's .status.loadBalancer field.

Traffic from the external load balancer is directed at the backend Pods. The cloud provider decides how it is load-balanced.

To implement a Service of type: LoadBalancer, Kubernetes typically starts off by making the changes that are equivalent to you requesting a 
Service of type: NodePort. The cloud-controller-manager component then configures the external load balancer to forward traffic to that assigned node port.
