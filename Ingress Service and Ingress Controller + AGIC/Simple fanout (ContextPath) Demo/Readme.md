# Simple fanout (Context path route-based) Demp
  - A fanout configuration routes traffic from a single IP address to more than one Service, based on the HTTP URI being requested.
  - Decide destination based on directory name

> [!Note]
> #### Fanout DEMO Requirments
> 
> **[/]** to cluster service **[mycustomnginx-image-service1:80]**
> 
> **[/app1]** to cluster service **[app1-service:80]**
> 
> **[/app2]** to cluster service **[app2-service:80]**
> 
> **[/app3]** to cluster service **[app3-service:80]**
> 

## Step 1: Setup 
* Create Resource Group
* Create ASK Cluster
* Configure AGIC addon
* Setup peering if AGIC and other resources are in different resource group

 ## Step 2: Deploy and Verify

```
# Deploy Apps
kubectl apply -f Files/

# List Pods
kubectl get pods

# List Services
kubectl get svc

# List Ingress
kubectl get ingress

```
## Step 3: Access Applications
```
# Access default
http://<Public-IP-created-for-Ingress>/

# Access App1
http://<Public-IP-created-for-Ingress>/app1/

# Access App2
http://<Public-IP-created-for-Ingress>/app2/

# Access App3
http://<Public-IP-created-for-Ingress>/app3/

```

## Step 4: Clean-Up Applications
```
# Delete Apps
kubectl delete -f files/
```
