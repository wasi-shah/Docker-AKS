# Run the base Nginx container with the default page
```
docker run --name mynginxdefault -p 80:80 -d nginx
docker ps
docker stop mynginxdefault
```
Access the URL http://localhost

# Create a custom image derived from NGINX image and change the index page with your custom page
## Create Dockerfile and copy our customized index.html
1. Create a folder
2. Add file Dockerfile and add the following code
```
FROM nginx
COPY index.html /usr/share/nginx/html
```
3. Create index.html in the same folder
```
<b> This is my custom nginx image. </b>
```
## Build Docker Image & run it
Replace your docker hub account Id
```
docker build -t wasishah102/mycustomnginx_image .
docker run --name mynginx1 -p 80:80 -d wasishah102/mycustomnginx_image
```
## Tag & push the Docker image to Docker hub
```
Replace your docker hub account Id
docker tag wasishah102/mycustomnginx_image wasishah102/mycustomnginx_image
docker push wasishah102/mycustomnginx_image
```
Check on Docker Hub to verify the image push successfully.

##Login to AKS
```
az aks get-credentials -n mycluster -g aksrg
```
## Create a pod
```
kubectl run custompod --image=wasishah102/mycustomnginx_image
```
## Expose pod on the internet through Load Balancer on AKS
```
kubectl expose pod custompod  --type=LoadBalancer --port=80 --name=customlb
```
