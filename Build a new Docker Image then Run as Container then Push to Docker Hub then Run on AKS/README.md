# Run the base Nginx container with default page
```
docker run --name mynginxdefault -p 80:80 -d nginx
docker ps
docker stop mynginxdefault
```
Access the URL http://localhost

# Create custom image drived from NGINX image and change the index page with your csutom page
## Create Dockerfile and copy our customized index.html
1. Create a folder
2. Add file Dockerfile and add following code
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
## Tag & push the Docker image to docker hub
```
Replace your docker hub account Id
docker tag wasishah102/mycustomnginx_image:v1 wasishah102/mycustomnginx_image:v1-release
docker push wasishah102/mycustomnginx_image:v1-release
```
Check on Docker Hub to verify the image push successfully.
