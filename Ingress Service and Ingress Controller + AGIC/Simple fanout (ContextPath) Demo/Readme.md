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
* Setup peering if AGIC and other resources are in different resource groups

 ## Step 2: Deploy and Verify
> [!note]
> Note the annotation of appgw.ingress.kubernetes.io/backend-path-prefix: “/” , this is required as the paths defined above do not exist on the backends, without this annotation we will receive 502 Bad Gateway errors.
 

```
# Deploy Apps
kubectl apply -f Files/
# pod/mycustomnginx created
# service/mycustomnginx-service created
# pod/app1 created
# service/app1-service created
# pod/app2 created
# service/app2-service created
# pod/app3 created
# service/app3-service created
# ingress.networking.k8s.io/fanout-demo created


# List Pods
kubectl get pods

# List Services
kubectl get svc

# List Ingress
kubectl get ingress

kubectl describe ingress fanout
# Output



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
