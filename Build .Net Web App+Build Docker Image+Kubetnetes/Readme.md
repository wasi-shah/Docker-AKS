# Running a .NET web application in Kubernetes

## Step 1: Create a .NET web application
```
mkdir WebApp 
cd WebApp
dotnet new webapp -n AspNetWebApp
cd AspNetWebApp
```
The command **dotnet new webapp -n AspNetWebApp** is used to create a new ASP.NET web application project using the .NET CLI (Command-Line Interface). Let’s break down this command and explain each part:

1. **dotnet new**: This is the base command for creating new projects in the .NET ecosystem. It allows you to create various types of projects, including web applications, console applications, class libraries, and more.
2. **webapp**: This part of the command specifies the type of project template you want to use. In this case, it’s the “webapp” template, which is used for creating ASP.NET web applications.

3. **-n AspNetWebApp**: The -n (or --name) option is used to specify the name of the new project. In this example, it’s set to “AspNetWebApp,” so the new project will be named “AspNetWebApp.”
When you run this command, the .NET CLI will generate the necessary project files and folders for an ASP.NET web application with the name “AspNetWebApp.” This includes:

A project file (usually named “AspNetWebApp.csproj”).
Default source code files, including a Startup.cs file.
A web configuration file (appsettings.json).
Other project-related files and folders.
The newly created ASP.NET web application project is based on the template and is ready for further customization and development. You can use it as a starting point to build web applications using the ASP.NET framework.

> [!NOTE]
> When you run this command, the .NET CLI will generate the necessary project files and folders for an ASP.NET web application with the name “AspNetWebApp.”
> This includes:
> 1. A project file (usually named “AspNetWebApp.csproj”).
> 2. Default source code files, including a Startup.cs file.
> 3. A web configuration file (appsettings.json).
> 4. Other project-related files and folders.

The newly created ASP.NET web application project is based on the template and is ready for further customization and development. You can use it as a starting point to build web applications using the ASP.NET framework.
## Step 2: Testing your ASP.NET WebApp
To test in the browser before dockerise it
```
dotnet watch run
http://localhost
```

## Step 3: Publish .NET app

Before adding the .NET app to the Docker image, first it must be published. It's best to have the container run the published version of the app. To publish the app, run the following command:
```
dotnet publish -c Release
```

## Step 4: Create the Dockerfile
The Dockerfile file is used by the docker build command to create a container image. This file is a text file named Dockerfile that doesn't have an extension.
```
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app
 
# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out
 
# Build the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "AspNetWebApp.dll"]
```
## Step 5: Create an image
```
docker build -t aspnetwebapp -f Dockerfile .
```

## Step 6: Create a container to Test
Test the docker image by running it as a docker container in the browser before Kubernetes it
```
docker run -p 5000:8080 aspnetwebapp
browse at http://localhost:5000/
```

## Step 7: Publish to docker hub
```
docker tag aspnetwebapp wasishah102/aspnetwebapp
docker push wasishah102/aspnetwebapp
```

## Step 8: Run on AKS

### Login to ASK
```
# Login to AKS
az aks get-credentials -n mycluster -g aksrg

# Create pod
kubectl run webapppod --image=wasishah102/aspnetwebapp

# Investigating a pod
kubectl exec -it  webapppod /bin/bash

# Run [ls] command to see the directory list - it will match the content of your project \bin\Release\net8.0\publish folder.
root@weapppod:app#/ ls

# Run [printenv] to expose all environment variables
root@webapppod:/app# printenv

# Run [exit] to exit the container shell
root@webapppod:/app# exit 

# Create load balancer service for pod with frontend port 80 and target container port to 8080
kubectl expose pod webapppod  --type=LoadBalancer --port=80 --target-port=8080 --name=webapplb

# Find external IP address
kubectl get svc

# Connect to website using browser
http:EXTERNAL-IP

# Clean Up!
kubectl delete svc webapplb
kubectl delete pod webapppod
```
