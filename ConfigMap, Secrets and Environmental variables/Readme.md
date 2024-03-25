# Passing Values to container
Almost all apps need values to start the application. These values can either be hardcoded inside the app or can be passed through as variables usign environment variables.
These environmental variables can be used like database connections string and other config variables like you mostly define in web.config or app setting files. 

# Define an environment variable for a container
When you create a Pod, you can set environment variables for the containers that run in the Pod. To set environment variables, include the env or envFrom field in the configuration file.
The env and envFrom fields have different effects.
## env
It allows you to set environment variables for a container, specifying a value directly for each variable that you name.
## envFrom
It allows you to set environment variables for a container by referencing either a ConfigMap or a Secret. When you use envFrom, all the key-value pairs in the referenced ConfigMap or Secret are set as environment variables for the container. You can also specify a common prefix string.

# env
> [!TIP]
> It allows you to set environment variables for a container, specifying a value directly for each variable that you name.

```
# pod-envars.yaml
apiVersion: v1
kind: Pod
metadata:
  name: envar-demo
  labels:
    purpose: demonstrate-envars
spec:
  containers:
  - name: envar-demo-container
    image: gcr.io/google-samples/node-hello:1.0
    env:
    - name: DEMO_GREETING
      value: "Hello from the environment"
    - name: DEMO_FAREWELL
      value: "Such a sweet sorrow"
```
1. Create a Pod based on that manifest:
```
kubectl apply -f pod-envars.yaml
```

2. List the running Pods:
```
kubectl get pods -l purpose=demonstrate-envars
The output is similar to:

NAME            READY     STATUS    RESTARTS   AGE
envar-demo      1/1       Running   0          9s
```

3. List the Pod's container environment variables:
```
kubectl exec envar-demo -- printenv
The output is similar to this:

NODE_VERSION=4.4.2
EXAMPLE_SERVICE_PORT_8080_TCP_ADDR=10.3.245.237
HOSTNAME=envar-demo
...
DEMO_GREETING=Hello from the environment
DEMO_FAREWELL=Such a sweet sorrow
```
> [!Note]
> The environment variables set using the env or envFrom field override any environment variables specified in the container image.

> [!Note]
> Environment variables may reference each other, however, ordering is important. Variables making use of others defined in the same context must come later in the list. Similarly, avoid circular references.

# envFrom
> [!Note]
> **envFrom**
> 
> It allows you to set environment variables for a container by referencing either a ConfigMap or a Secret. When you use envFrom, all the key-value pairs in the referenced ConfigMap or Secret are set as environment variables for the container. You can also specify a common prefix string.

> [!Note]
> **Secrets**
> 
> A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. Such information might otherwise be put in a Pod specification or in a container image. Using a Secret means that you don't need to include confidential data in your application code.

> [!tip]
> ** Secrets allow the kubelet to pull container images from private registries.**

> [!Note]
> **ConfigMap**
> 
> A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.
A ConfigMap allows you to decouple environment-specific configuration from your container images so that your applications are easily portable.


## Secrets

### Create Secrets Imperative way

To  fetch Secrets
```
Kubectl get secrets
```

To decode a Secret
```
echo -n 'dsfldfkdlsfkdl' | base64 --decode
```

Create a Secret from command line
```
Kubectl create secret generic mysecuritykeys 
--from-literal=App_Color=cGluaw==
--from-literal=App_DbName=TXlQcm9kRGI=
--from-literal=App_Color=UGFzc3dvcmQwMDAh
```

create a Secret from a file
```
Kubectl create secret generic mysecuritykeys 
--from-file=myfile.properties
 

The contents of myfile.properties
App_Color: cGluaw==
App_DbName: TXlQcm9kRGI=
App_Color: UGFzc3dvcmQwMDAh
```

### Create Secrets Declarative way
 
Create a Secret definition file
```
# mysecuritydefinition.yaml
apiVersion: v1
kind: Security
metadata:
  name: mysecuritykeys 
data:
 App_Color: cGluaw==
 App_DbName: TXlQcm9kRGI=
 App_Color: UGFzc3dvcmQwMDAh
```
Create a Secret from the file
```
Kubectl create -f mysecuritydefinition.yaml
```


