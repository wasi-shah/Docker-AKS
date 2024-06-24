# Kubernetes

## Definition
[!Note] Kubernetes is an open-source container orchestration software.

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
[!Note] > Kubernetes v1.29 supports clusters with up to 5,000 nodes.

#### Master Node
The master node is responsible for running several Kubernetes processes that are absolutely necessary to run and manage the cluster properly:
##### API Server:
[!Note] API Server allows communication between different Kubernetes clients and the cluster
This is essentially the entry-point to the Kubernates cluster, which itself is a container. This is the process that allows communication between different Kubernetes clients and the cluster. The clients include the UI, if we are using the Kubernetes Dashboard, the API if we are running scripts, or the command-line tool. All these clients talk to the API Server to interact with the cluster.

##### Scheduler:
It’s job is to make sure that the pod is successfully assigned to a best node. 
It chooses the best node for a pod according to pod definition. For example node name, node selector etc.

##### Controller Manager:
##### Etcd:

#### Worker Node
##### Kubelet Service:
##### Kube-proxy Service:
##### Container Runtime:

## Pods
### Types on Pods
### Types of Containers in a Pod
### Passing Values to a Pod/Container
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

