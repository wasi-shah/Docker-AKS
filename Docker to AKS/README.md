# Docker to AKS 
```
docker version
docker login
```
## Pull Image from Docker Hub
```
docker pull wasishah102/babystep
```
## Run a container from Image
```
docker run --name babycon -p 80:3000 babystep
```
## Push Image to Docker Hub
```
docker tag babystep wasishah102/babystep
docker push wasishah102/babystep
```

## Create an project, create an image, push to docker, run as Kubernetes pod and expose pod with Load Balancer service
1. Install Docker
2. Create a project in a folder
3. Add or modify Dockerfile
```
docker build -t babystep .
```
4. Run the container from the images
```
docker run --name babycon -p 80:3000 babystep
```
5. Test the app in browser http//:IP:80
6. Push the image to the Docker Hub
```
docker push wasishah102/babystep
```
7. Login to AKS
```
az aks get-credentials -n mycluster -g aksrg
```
8. Create a pod
```
kubectl run babypod --image=wasishah102/babystep
```
9. Expose pod on the internet through Load Balancer on AKS
```
kubectl expose pod babypod  --type=LoadBalancer --port=80 --name=babylb
```
If container uses a different port, then you can mention a target port imperatively or in Load blancer definition.
```

# Method 1: Create a service which serves on port 80 and connects to the containers on port 3000
kubectl expose pod babypod  --type=LoadBalancer --port=80 --target-port=3000 --name=babylb
```

```
# Method 2: Define target port by creating YAML from imperative comamnd.
kubectl expose pod babypod  --type=LoadBalancer --port=80  --name=babylb --dry-run=client -o yaml > lb.yaml
vim lb.yaml
---

apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: babypod
  name: babylb
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 3000
  selector:
    run: babypod
  type: LoadBalancer
status:
  loadBalancer: {}
---

kubectl apply -f lb.yaml
```

## Pull a project from GitHub, create an image, push to docker, run as Kubernetes pod and expose pod with Load Balancer service
1. Install Docker
2. Intall GitHub
3. Pull a project in a folder
```
git clone https://github.com/docker/welcome-to-docker babystep 
```

4. Add or modify Dockerfile
```
docker build -t babystep .
```
5. Run the container from the images
```
docker run --name babycon -p 80:3000 babystep
```
6. Test the app in browser http//:IP:80
7. Push the image to the Docker Hub
```
docker push wasishah102/babystep
```
8. Login to AKS
```
az aks get-credentials -n mycluster -g aksrg
```
9. Create a pod
```
kubectl run babypod --image=wasishah102/babystep
```
10. Expose pod on the internet through Load Balancer on AKS
```
kubectl expose pod babypod  --type=LoadBalancer --port=80 --name=babylb
```
If container uses a different port, then mention a target port in Load blancer definition. Create YAML from imperative comamnd.
```
kubectl expose pod babypod  --type=LoadBalancer --port=80  --name=babylb --dry-run=client -o yaml > lb.yaml
vim lb.yaml
---

apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: babypod
  name: babylb
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 3000
  selector:
    run: babypod
  type: LoadBalancer
status:
  loadBalancer: {}
---

kubectl apply -f lb.yaml
```
# Validating Outcome
Get Service Info
'''
kubectl get service
kubectl get svc
'''
Describe Service
'''
kubectl describe service my-first-service
'''
Access Application
'''
http://<External-IP-from-get-service-output>
'''
Verify the following after LB Service creation
* Azure Standard Load Balancer created for Azure AKS Cluster
* Frontend IP Configuration
* Load Balancing Rules
* Azure Public IP
View the resources in Azure AKS Cluster - Resources section from Azure Portal Management Console
Interact with a Pod

# Clean-Up
Get all Objects in default namespace
```
kubectl get all
```

Delete Services
```
kubectl delete svc babylb
```
Delete Pod
```
kubectl delete pod babypod
```
Get all Objects in default namespace
```
kubectl get all
```
Delete all resources inside azure 
