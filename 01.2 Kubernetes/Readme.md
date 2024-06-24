# Kubernetes

## Definition
> [!Note] 
> Kubernetes is an open-source container orchestration software.

Kubernetes is an open-source system that automates the management, scaling, and deployment of containerized applications.
Kubernetes is open-source orchestration software that provides an API to control how and where those containers will run. It allows you to run your Docker containers and workloads and helps you to tackle some of the operating complexities when moving to scale multiple containers, deployed across multiple servers.
Kubernetes lets you orchestrate a cluster of virtual machines and schedule containers to run on those virtual machines based on their available compute resources and the resource requirements of each container. Containers are grouped into pods, the basic operational unit for Kubernetes. These containers and pods can be scaled to your desired state and you’re able to manage their lifecycle to keep your apps up and running. 
The fully managed Azure Kubernetes Service (AKS) ia a PAAS and makes deploying and managing containerised applications easy. It offers serverless Kubernetes, an integrated continuous integration and continuous delivery (CI/CD) experience, and enterprise-grade security and governance.


## Kubernetes Components
When you deploy Kubernetes, you get a cluster.

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.

The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

### The Kubernetes cluster
A Kubernetes cluster is made up of at least one master node and one or more worker nodes. The master node makes up the control plane of a cluster and is responsible for scheduling tasks and monitoring the state of the cluster. The key advantage of the Kubernetes cluster is that it is not a physical cluster; rather, it is an abstraction. It does not matter whether the nodes in the cluster are virtual machines or bare-metal, on-premises, or on the cloud; Kubernetes can run containerized applications on any group of such machines. 
> [!Note] 
> Kubernetes v1.29 supports clusters with up to 5,000 nodes.

#### Master Node
The master node is responsible for running several Kubernetes processes that are absolutely necessary to run and manage the cluster properly:
##### API Server:
> [!Note] 
> API Server allows communication between different Kubernetes clients and the cluster

This is essentially the entry-point to the Kubernates cluster, which itself is a container. This is the process that allows communication between different Kubernetes clients and the cluster. The clients include the UI, if we are using the Kubernetes Dashboard, the API if we are running scripts, or the command-line tool. All these clients talk to the API Server to interact with the cluster.

##### Scheduler:
It’s job is to make sure that the pod is successfully assigned to a best node. 
It chooses the best node for a pod according to pod definition. For example node name, node selector etc.

##### Controller Manager:
Controller does the job according to scheduler. This keeps track of the state of the cluster. It keeps an eye on the cluster and checks whether a node needs to be repaired or restarted.

##### Etcd:
This is the key-value storage responsible for holding the state of the cluster at any given time. etcd has the configuration information and status data of each node in the cluster. etcd snapshots allow us to recover the whole cluster state, hence it is used in backing up and restoring a cluster.

#### Worker Node
The worker nodes are the part of the Kubernetes clusters which execute the containers and applications on them. They have two main components, the Kubelet Service and the Kube-proxy Service.
##### Kubelet Service:
-	It runs on worker nodes of a Kubernetes cluster.
-	It sits on Worker node as a node captain.
-	Each worker node has a Kubelet process running on it that allows the cluster to talk to each other and execute some tasks on the worker nodes, such as running application processes. 
-	It listens for instructions from the Api Server and manages containers running on the node. kubelet is a part of the Kubernetes cluster (server) software.
-	It sees what pods needs to be realized on a node and realizes them in the form of running docker containers. As such it talks a lot to the docker layer on the node.


##### Kube-proxy Service:
-	The Kube-Proxy Service is responsible for enabling communication between services within the cluster.
-	It helps all pods to reach each other across the cluster.
-	It supports services like ClusterIP, NodePort etc.

##### Container Runtime:
You need a working container runtime on each Node in your cluster, so that the kubelet can launch Pods and their containers. Worker node also have a container run time for example docker runtime. You need to install a container runtime into each node in the cluster so that Pods can run there. A fundamental component that empowers Kubernetes to run containers effectively. It is responsible for managing the execution and lifecycle of containers within the Kubernetes environment.
These worker nodes have docker containers for each application running on them. There may be a different number of containers running on each node depending on the distribution of the workload.
Worker nodes are generally more powerful than master nodes because they have to run hundreds of clusters on them. However, master nodes hold more significance because they manage the distribution of workload and the state of the cluster.



## Pods
-	Pod is the smallest element in the Kubernetes.
-	The contains containers. Pods has an internal IP address assigned by the Kubernetes and it acts like a mini machine.
-	It can have multiple containers, but the containers must be doing a related job because it recycles together.
-	You can have 110 pods ins one node max to 256. It means you can have max 265 IP allocations inside the node because each pods get one IP.

### Types on Pods
#### Application Pods
This is your main pod where your application runs.

#### Static Pods 
You store pod definition directly on a node and this create a pod without need a master node. You need to ssh into the node and save pod definition into a folder location /etc/kubernetes/manifests.
Static Pods are managed directly by the kubelet daemon on a specific node, without the API server observing them. Unlike Pods that are managed by the control plane (for example, a Deployment); instead, the kubelet watches each static Pod (and restarts it if it fails).
Static Pods are always bound to one Kubelet on a specific node.
The kubelet automatically tries to create a mirror Pod on the Kubernetes API server for each static Pod. This means that the Pods running on a node are visible on the API server, but cannot be controlled from there. The Pod names will be suffixed with the node hostname with a leading hyphen.

#### DaemonSets
Used to deploy background services across all pods in a selected set. DaemonSet is a Kubernetes feature that lets you run a Kubernetes pod on all cluster nodes that meet certain criteria. Every time a new node is added to a cluster, the pod is added to it, and when a node is removed from the cluster, the pod is removed. When a DaemonSet is deleted, Kubernetes removes all the pods created by it.
In a Kubernetes architecture, DaemonSets are used for deploying background services across clusters, providing support services for every node—such as system operations services, collecting logs, monitoring frameworks like Prometheus, and storage volumes.
Commands
-	Kubectl get demonsets
-	Kubectl describe demonsets namehere

#### Storage in Pods
-	A Pod can specify a set of shared storage volumes.
-	All containers in the Pod can access the shared volumes, allowing those containers to share data.
-	Volumes also allow persistent data in a Pod to survive in case one of the containers within needs to be restarted.

#### Pod networking
-	Each Pod is assigned a unique IP address for each address family.
-	Every container in a Pod shares the network namespace, including the IP address and network ports. Inside a Pod (and only then), the containers that belong to the Pod can communicate with one another using localhost.
-	When containers in a Pod communicate with entities outside the Pod, they must coordinate how they use the shared network resources (such as ports).
-	Within a Pod, containers share an IP address and port space, and can find each other via localhost.
-	The containers in a Pod can also communicate with each other using standard inter-process communications like SystemV semaphores or POSIX shared memory.
-	Containers in different Pods have distinct IP addresses and can not communicate by OS-level IPC without special configuration.
-	Containers that want to interact with a container running in a different Pod can use IP networking to communicate.
-	Containers within the Pod see the system hostname as being the same as the configured name for the Pod.

### Containers in Pod

#### Types of Containers in a Pod

##### Main Application containers
This is your container which is your main app. If starts after InitContainer finished.

##### InitContainers
-	These are specialized containers that run before app containers in a Pod.
-	Init containers are exactly like regular containers, except:
-	Init containers always run to completion.
-	Each init container must complete successfully before the next one starts.
-	If you specify multiple init containers for a Pod, kubelet runs each init container sequentially.
-	Ensures that the main container starts with the necessary prerequisites.

##### Multi-Container Pod design pattern
###### Adapter containers 
Adapter containers standardize and normalize output.  Consider the task of monitoring N different applications.  Each application may be built with a different way of exporting monitoring data.
###### Sidecar Containers
Data Puller: Sidecar pulls data required by main container.
Data Pusher: Push data generated by main container to log.
Sidecar containers are the secondary containers that run along with the main application container within the same Pod. These containers are used to enhance or to extend the functionality of the main application container by providing additional services, or functionality such as logging, monitoring, security, or data synchronization, without directly altering the primary application code.
Sidecar containers run alongside regular containers in the same pod. However, they do not execute the primary application logic; instead, they provide supporting functionality to the main application.
Sidecar containers have their own independent lifecycles. They can be started, stopped, and restarted independently of regular containers. This means you can update, scale, or maintain sidecar containers without affecting the primary application.
Sidecar containers share the same network and storage namespaces with the primary container This co-location allows them to interact closely and share resources.


#### Single container Vs Multi container 

Pods that run a single container: 
The "one-container-per-Pod" model is the most common Kubernetes use case; in this case, you can think of a Pod as a wrapper around a single container. Kubernetes manages Pods rather than managing the containers directly.

Pods that run multiple containers: 
-	Containers is the pod shared the same life-cycle as pod.
-	The create together and destroy together.
-	A Pod can encapsulate an application composed of multiple co-located containers that are tightly coupled and need to share resources. These co-located containers form a single cohesive unit.
-	The containers in a Pod are automatically co-located and co-scheduled on the same physical or virtual machine in the cluster. The containers can share resources and dependencies, communicate with one another, and coordinate when and how they are terminated.
-	Grouping multiple co-located and co-managed containers in a single Pod is a relatively advanced use case.
-	You should use this pattern only in specific instances in which your containers are tightly coupled.

### Passing Values to a Pod/Container
Almost all apps need values to start the application, these can be used like database connections and other config variables like you mostly define in web.config or app setting files. 

You can pass values to pod as environment or as volume. This configuration is called app environment.
-	Command
-	Args
-	Env : allows you to set environment variables for a container, specifying a value directly for each variable that you name.
-	EnvFrom
    -	configMapRef
	-   secretRef
-	volumeMounts
-	volumes
> [!Note ]
> You can pass values to pod as environment or as volume.

#### Secrets:
A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. Such information might otherwise be put in a Pod specification or in a container image. Using a Secret means that you don't need to include confidential data in your application code.

> Uses for Secrets:

You can use Secrets for purposes such as the following:
-	Set environment variables for a container.
-	Provide credentials such as SSH keys or passwords to Pods.
-	Allow the kubelet to pull container images from private registries.


### Retrieving values from container
### Pod Health Monitoring
#### Startup probes
#### Liveness Probe
#### Readiness Probes
### Pod Scheduling


## Kubernetes: Workloads
## Kubernetes: Services, Load Balancing, and Networking

## Kubernetes: Scaling

## Kubernetes: Storage

## Kubernetes: Security
### Authentication
### Authorization 

## Monitoring in Kubernetes

## Kubernetes Cluster Providers

## Kubernetes Tools
### Command Tools

