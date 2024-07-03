# Docker
Docker is a tool for running containerized apps. A containerized app includes the app and the filesystem that makes up the environment in which it runs. For example, a containerized app could consist of a database and other associated software and configuration information needed to run the app.

Docker is an open-source technology—and a container file format—for automating the deployment of applications as portable, self-sufficient containers that can run in the cloud or on-premises. Docker, Inc., although it shares a similar name, is one of the companies that cultivates the open-source Docker technology to run on Linux and Windows in collaboration with cloud providers like Microsoft.

While the idea of isolating environments is not new and there are other types of containerization software, Docker has grown to be the default container format in recent years. Docker features the Docker Engine, which is a runtime environment. It allows you to build and run containers on any development machine; then store or share container images through a container registry like Docker Hub or Azure Container Registry

## The Docker daemon (dockerd)
The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

## The Docker client
The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

## Docker Desktop
Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper.

## DOCKER HUB
Docker Hub is a service provided by Docker for finding and sharing container images with your team

## Docker registries
A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker looks for images on Docker Hub by default. You can even run your own private registry.

When you use the docker pull or docker run commands, Docker pulls the required images from your configured registry. When you use the docker push command, Docker pushes your image to your configured registry.

## Docker Images
Docker images are a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

A Docker image is a prepackaged environment containing the application code and the environment in which the code executes.

An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

### Linux and Windows Docker images
Docker was initially developed for Linux and has since expanded to support Windows. Individual Docker images are either Windows-based or Linux-based, but can't be both at the same time. The image's operating system determines what kind of operating system environment is used inside the container.

> [!NOTE]
> Authors of Docker images who wish to offer similar functionality in both Linux-based and Windows-based images can build those images separately. For example, Microsoft offers Windows and Linux Docker images containing an ASP.NET Core environment you can use as the basis for containerized ASP.NET Core applications.

* Linux computers with Docker installed can only run Linux containers.
* Windows computers with Docker installed can run both kinds of containers. Windows runs both by using a virtual machine to run a Linux system and uses the virtual Linux system to run Linux containers.

## Containers
A container is a runtime instance of a docker image. A container will always run the same, regardless of the infrastructure. Containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging.

A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.

By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container's network, storage, or other underlying subsystems are from other containers or the host machine.

A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.

## Docker Commands
### GENERAL COMMANDS
```
Start the docker daemon
docker -d

Get help with Docker. Can also use –help on all subcommands
docker --help

Display system-wide information
docker info
```

### DOCKER HUB COMMANDS
```
Login into Docker
docker login -u <username>

# Login to ACR
docker login YOUR-REGISTRY-URL
docker login myregistryname.azurecr.io

# OR Save your registry URL in a variable 
export ACR_REGISTRY=myregistryname.azurecr.io
docker login $ACR_REGISTRY

Publish an image to Docker Hub
docker push <username>/<image_name>

Search Hub for an image
docker search <image_name>

Pull an image from a Docker Hub
docker pull <image_name>

```

### CONTAINERS COMMANDS
```
Create and run a container from an image, with a custom name:
docker run --name <container_name> <image_name>

Run a container with and publish a container’s port(s) to the host.
docker run -p <host_port>:<container_port> <image_name>

Run a container in the background
docker run -d <image_name>

Start or stop an existing container:
docker start|stop <container_name> (or <container-id>)

Remove a stopped container:
docker rm <container_name>

Open a shell inside a running container:
docker exec -it <container_name> sh

Fetch and follow the logs of a container:
docker logs -f <container_name>

To inspect a running container:
docker inspect <container_name> (or <container_id>)

To list currently running containers:
docker ps

List all docker containers (running and stopped):
docker ps --all

View resource usage stats
docker container stats

```

### IMAGES COMMANDS
```
Build an Image from a Dockerfile
docker build -t <image_name>

Build an Image from a Dockerfile without the cache
docker build -t <image_name> . –no-cache

List local images
docker images

Delete an Image
docker rmi <image_name>

Remove all unused images
docker image prune
```

## Commonly used commands



### Build a Docker Image from the source code & run it

```
docker build -t <imagename> location
For example, if your project and Dockerfile are in the current folder and you wish to create an image named 'mycustomnginx_image' then run:
docker build -t mycustomnginx_image .
```
## Tag & push the Docker image to the Docker hub
```
Replace your docker hub account ID
docker tag wasishah102/mycustomnginx_image wasishah102/mycustomnginx_image
docker push wasishah102/mycustomnginx_image
```

### Pull Image from Docker Hub

```
docker pull wasishah102/mycustomnginx_image
```


### Run the downloaded Docker Image & Access the Application

```
docker run --name app1 -p 80:8080 -d wasishah102/mycustomnginx_image
http://localhost/

```



### List Running Containers

```
docker ps
docker ps -a
docker ps -a -q
```

###  Connect to Container Terminal

```
docker exec -it <container-name> /bin/sh
```

### Container Stop, Start

```
docker stop <container-name>
docker start  <container-name>
```

### Remove Container

```
docker stop <container-name> 
docker rm <container-name>
```

### Remove Image

```
docker images
docker rmi  <image-id>
```



# Docker sample application
## Create Dockerfile and copy our customized index.html
1. Create a folder
2. Add file Dockerfile and add the following code
```
FROM nginx
COPY index.html /usr/share/nginx/html
```
3. Create index.html in the same folder
```
<b> This is my custom Nginx image. </b>
```
## Build Docker Image & run it
Replace your docker hub account ID
```
docker build -t wasishah102/mycustomnginx_image .
docker run --name mynginx1 -p 80:80 -d wasishah102/mycustomnginx_image
```
## Tag & push the Docker image to the Docker hub
```
Replace your docker hub account ID
docker tag wasishah102/mycustomnginx_image wasishah102/mycustomnginx_image
docker push wasishah102/mycustomnginx_image
```
Check on Docker Hub to verify the image push successfully.


https://www.docker.com/resources/cli-cheat-sheet/

