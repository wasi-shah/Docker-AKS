# Docker cheat sheet 
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
If container uses a different port, then mention a target port in Load blancer definition. Create YAML from imperitive comamnd.
```
kubectl expose pod babypod  --type=LoadBalancer --port=80  --name=babylb --dry-run=client -o yaml > lb.yaml
vim lb.yaml

-----
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
    targetPort: **3000**
  selector:
    run: babypod
  type: LoadBalancer
status:
  loadBalancer: {}
-----

kubectl apply -f lb.yaml
```


