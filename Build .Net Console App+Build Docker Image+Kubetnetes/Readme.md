# Running a .NET console application in Kubernetes
## Prerequisites
Before we begin, make sure you have the following prerequisites in place:

1. .NET SDK: You’ll need .NET 6.0 or newer installed on your local machine. If you haven’t already, you can download and install it from the official .NET website.
2. Docker: Ensure that Docker is installed on your local machine. You can download Docker Desktop for your operating system from the Docker website.
3. Kubernetes Cluster: You should have a Kubernetes cluster up and running. If you don’t have one, you can set up a local Kubernetes cluster using tools like Minikube or use a cloud-based Kubernetes service.

# ASP.NET Application Development
## Step 1: Create a .NET console application
Let’s start by creating a simple .NET console application. Open your terminal and run the following commands:
```
mkdir helloworld 
cd helloworld
dotnet new console -o App -n helloworld
```
The command **dotnet new console -o App -n helloworld** is used to create a new .NET console application project with specific settings and options. Let’s break down the command and explain each part:

1. **dotnet new**: This is the base command for creating new projects in the .NET ecosystem. It allows you to create various types of projects, including console applications, web applications, class libraries, and more.
2. **console**: This part of the command specifies the type of project template you want to use. In this case, it’s the “console” template, which is used for creating command-line applications.
3. **-o App**: The -o (or --output) option is used to specify the output directory for the new project. In this example, it’s set to “App,” which means that the new project files and folders will be created in a directory named “App” within the current working directory.
4. **-n helloworld**: The -n (or --name) option is used to specify the name of the new project. In this example, it’s set to “helloworld,” so the new project will be named “helloworld.”

> [!TIP]
> When you run this command, .NET will generate the necessary project files, including the project file (.csproj), source code files, and other project-related files, in the “App” directory with the name “helloworld.” This newly created project will be a basic console application template, which you can then customize and build upon to create your command-line application in .NET.

## Step 2: Modify the Program.cs
Edit the Program.cs file in your project directory (App) and replace its contents with the following code:

```
using System;
using System.Threading.Tasks;
 
var counter = 0;
 
while (true)
{ 
    Console.WriteLine($"Hello: {++counter}");
    await Task.Delay(TimeSpan.FromMilliseconds(1_000));
}
```


## Step 3: Run the application in debug mode
You can run your application in debug mode using the following command:
```
cd App
dotnet run
# Output
Hello: 1
Hello: 2
Hello: 3
Hello: 4
Hello: 5
Hello: 6
Hello: 7

```

## Step 4: Build a release version

```
dotnet publish -c Release
```
Let’s break down this command and explain each part:

1. **dotnet publish**: This is a .NET CLI (Command-Line Interface) command used to build and publish a .NET project. Publishing a project means generating the necessary files and assemblies that can be deployed and run on a target environment.
2. **-c Release**: The -c (or --configuration) option is used to specify the build configuration for the project. In this case, it is set to “Release.” The build configuration determines how the project is built, and it can typically be one of the following:
**Debug**: This configuration is optimized for debugging and includes additional debugging information. It is suitable for development and testing environments.
**Release**: This configuration is optimized for production deployment. It typically includes optimizations like code minification, removal of debug symbols, and other performance-related optimizations to make the application run efficiently in a production environment.


docker build -t aspnet-cousole-counter-image -f Dockerfile .
docker tag aspnet-cousole-counter-image wasishah102/aspnet-cousole-counter-image
docker push wasishah102/aspnet-cousole-counter-image

az aks get-credentials -n mycluster -g aksrg


kubectl run consoleapp --image=wasishah102/aspnet-cousole-counter-image
kubectl logs consoleapp -f
