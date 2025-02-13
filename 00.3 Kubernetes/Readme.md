# Kubernetes

## Definition
> [!Note] 
> Kubernetes is an open-source container orchestration software.

Kubernetes is an open-source system that automates the management, scaling, and deployment of containerized applications.
Kubernetes is open-source orchestration software that provides an API to control how and where those containers will run. It allows you to run your Docker containers and workloads and helps you to tackle some of the operating complexities when moving to scale multiple containers, deployed across multiple servers.
Kubernetes lets you orchestrate a cluster of virtual machines and schedule containers to run on those virtual machines based on their available compute resources and the resource requirements of each container. Containers are grouped into pods, the basic operational unit for Kubernetes. These containers and pods can be scaled to your desired state and you’re able to manage their lifecycle to keep your apps up and running. 
The fully managed Azure Kubernetes Service (AKS) ia a PAAS and makes deploying and managing containerised applications easy. It offers serverless Kubernetes, an integrated continuous integration and continuous delivery (CI/CD) experience, and enterprise-grade security and governance.

> [!important]
> **Question: What Kubernetes does?** 
> <br> **Kubernetes deploy, manage, and scale the containerised applications:** 

> [!important]
> **Question: What is a Kubernetes cluster?** 
> <br> **A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one master and worker node.** 

> [!important]
> **Question: What is a master node and it's components?** 
> <br> **The master node is responsible for running several Kubernetes processes that are absolutely necessary to run and manage the cluster.** 
> <br> Master node components are
- API Server
- Scheduler
- Controller Manager
- ETCD. 


> [!important]
> **Question: What is a worker node and it's components?** 
> <br> **The worker nodes are the part of the Kubernetes clusters which execute the containers and applications on them.** 
> <br>Workernode components are
- Kubelet Service
- Kube-proxy Service
- Container Runtime.

> [!important]
> **Question: How many nodes can a cluster have?** 
> <br> **Kubernetes v1.29 supports clusters with up to 5,000 nodes.** 


> [!important]
> **Question: How can you extend the functionality of Kubernetes?** 
> <br> **You can add add-ons to extend functionality**
> > <br> **Addons runs as a demonset.**
> <br> for example
- DNS
- Web UI (Dashboard)
- Container Resource Monitoring
- Cluster-level Logging
- Network Plugins.



> [!important]
> **Question: What is a Namespaces and four initial namespaces?** 
> <br> **Namespaces provide a mechanism for isolating groups of resources within a single cluster.** 
> <br> Initial namespaces are
- default
- kube-system
- kube-public
- kube-node-lease

> [!important]
> **Question: What ae the three objecy Management technique available in Kubernetes?** 
> <br> **1. Imperative commands - for example kubectl create deployment nginx --image nginx.** 
> <br> **2. Imperative object configuration - for example  kubectl create -f nginx.yaml**
> <br> **3. Declarative object configuration - for example kubectl apply -f configs/**



> [!important]
> **Question: What is a pod?** 
> <br> **A pod is the smallest object and works like a VM and always has an internal IP address assigned.** 
> <br> **Pod runs container inside. Pod represents a set of running containers on your cluster.**


> [!important]
> **Question: How many pods can you have on a single node**
> <br>**110 to 265**



> [!important]
> **Question: What are the three types of Pods?** 
> <br> **1. Application pods.** 
> <br> **2. Static Pods.**
> <br> **3. Demonsets.**

> [!important]
> **Question: What are the two types of containers pod can have?** 
> <br> **1. Application Container.** 
> <br> **2. InitContainer.**


> [!important]
> **Question: Can you have multiple initContainer in  a single pod.**
> <br> **Yes, if you specify multiple init containers for a Pod, kubelet runs each init container sequentially.**

> [!important]
> **Question: What are the two ways you can pass values to a Pod/Container?** 
> <br> **1. Environment.** 
> <br> **2. Volume.**

> [!important]
> **Question: How can you retrieve values back from pod?** 
> <br> **You can shell into the container using exec and display file content or print environment variables.** 

> [!important]
> **Question: How you monitor pod health and what are the three probes available?** 
> <br> **Kubernetes track, check and react to three probes.** 
> <br> **1. Startup probes - to know when a container application has started.**
> <br> **2. Liveness Probe - Checks if app is still alive – if not kill and start new pod.**
> <br> **3. Readiness Probes - Checks if the pod is less busy for the incoming request. If not, it passes the traffic to less busy pod. It does not kill the pod.**

> [!important]
> **Question: Can you control pod scheduling and how?** 
> <br> **There are many ways you can control pod scheduling. For example through 
> <br>NodeName, 
> <br>NodeSelector, 
> <br>Labels, 
> <br>Affinity and anti-affinity, 
> <br>Taint and Toleration, 
> <br>and forcing Pod CPU/Memory resource requirements.** 

> [!important]
> **Question: What is a WordLoad and it's four types?** 
> <br> **A Workload is the actual execution of application. It can be following four types** 
> <br> **1. Deployment - For running a stateless application workload on your cluster, where any Pod in the Deployment is interchangeable and can be replaced if needed.**
> <br> **2. StatefulSet - For running one or more related Pods that do track state. It matches each Pod with a PersistentVolume.**
> <br> **3. DaemonSet - For running Pods on all nodes. Addons runs as a demonset.**
> <br> **4. Job & CronJob - Job define a task that runs to completion, just once. CronJob rubs a Job multiple times according a schedule.**

> [!important]
> **Question: What are the two deployment Strategies available?** 
> <br> **1. RollingUpdate - Pods are killed and create one-by-one** 
> <br> **2. Recreate - All existing Pods are killed then create**

> [!important]
> **Question: What are the two types of applications?** 
> <br> **1. Stateless - By default, the pods are stateless so when the pod deletes its data also deletes.** 
> <br> **2. StatefullSet - The StatefulSet provisions a PersistentVolumeClaim in a single yaml file. To help prevent data loss, PersistentVolumes and PersistentVolumeClaims are not deleted when a StatefulSet is deleted**


> [!important]
> **Question: What are the four types of scaling available in Kubernetes?** 
> <br> **1. - ReplicaSets: An object which create/delete pods to match the desired number of pods.** 
> <br> **2. - Vertical Pod Autoscaler (VPA): (add/remove resources to existing pod) automatically change your pod CPU/Memory limited based on it’s usage both up and down.**
> <br> **3. - Horizontal Pod Autoscaler (HPA): (add/remove new pods) An object which create/delete pods to match the performance for example, if the pod exceeds 50% CPU then create a new pod.**
> <br> **4. - Cluster Autoscaler: (add/remove nodes) Automatically adds or removes nodes in a cluster based on all pods’ requested resources & HPA. Cluster Autoscaler works with Horizonal Pod Scaler to automatically adds or removes nodes in a cluster based on demand.**


> [!important]
> **Question: What is the Kubernetes networking unique IP law and how CNI addon helps?** 
> <br> **Kubernetes wants all pods/Nodes IPs to be unique. For this you can use 3rd party tool called CNI (Container Network Interface) API like:** 
> <br> **WeaveNet, Cisco, Flannel, VMware, NSX, Cilium to make sure IP uniqueness.**

> [!important]
> **Question: What is a DNS service and why we need it DNS addons? Name three important DNS Addons** 
> <br> **DNS service assing a name to an IP so we can call objects by using a name (instead of IP).** 
> <br> **1. coreDNS - When you create a new pod or service, it records its endpoint IP and access url so it can resolve it. For example now you can use 'web-service-default.svc.cluster.local' instead of '10.97.206.196'**
> <br> **2. External DNS - It's an addon to map a domain name to ingress service**
> <br> **3. Cert Manager - It's an addon to install and renew SSL**

> [!important]
> **Question: What is a service and it's four types?** 
> <br> **Service is a method for exposing a network application that is running as one or more Pods in your cluster.** 
> <br> **1. ClusterIP (default service) - Expose a workload locally as a service.**
> <br> **2. NodePort (To Internet through a Worker Node) - Expose a workload to a cluster port.**
> <br> **3. LoadBalancer (To Internet) - Exposes the Service/Workload externally using an external load balancer.**
> <br> **4. ExternalName (From Internet) - It is used to connect the pods to an external MySQL database sitting on Azure through a CNAME.**


> [!important]
> **Question: What is a Ingress service and it's two types?** 
> <br> **It's like a level 7 load balance same as application gateway which can pass the control to another service based on the url.** 
> <br> **1. Simple fanout - example [ Abc.com/foo to service1:80 ] & [ Abc.com/bar service2:80 ].**
> <br> **2. Sub domain level ingress - example [ foo.abc.com service1:80 ] & [ bar.abc.com service2:80 ].**

> [!important]
> **Question: Why you need an Ingress Control Addon and naem one Ingress controler?** 
> <br> **In order for an Ingress to work in your cluster, there must be an ingress controller running. You need to select at least one ingress controller and make sure it is set up in your cluster.** 
> <br> **AGID - AKS Application Gateway Ingress Controller is an ingress controller that configures the Azure Application Gateway..**


> [!important]
> **Question: Why we need storage in Kubernetes and What are the three storage options available?** 
> <br> **We need storage becuase the container state is not saved so all of the files that were created or modified during the lifetime of the container are lost. During a crash, kubelet restarts the container with a clean state..**
> <br> **1. Volumes - A semi=erment storage and it's type defines where data is stored and when it’s data will be deleted** 
> <br> **2. Persistance Volumes -  A perment storage in the cluster to save the data permanently.**

> [!important]
> **Question: What are the three ways to attach volumes to pod?** 
> <br> **1. Directly - Create a PV and assign a PV name is pod definition** 
> <br> **2. Persistence Volume Claim - You create 1.PV and the 2.Claim you define how much space you need. The claim then attached to the pod.**
> <br> **3. Storage Classes - It creates the PV automatically to satisfy a PersistentVolumeClaim (PVC) for example create a sstorage calss using azure-file**
> [!important]
> **Question: Name few types of volumes?** 
> <br> **1. emptyDir - it's a temprary storage. All containers in the Pod can read and write the same files in the emptyDir volume. When a Pod is removed from a node for any reason, the data in the emptyDir is deleted permanently.
** 
> <br> **2. hostPath - hostPath is node level storage (not for production). If node is deleted the hostpath data is deleted.**
> <br> **2. downwardAPI - A downwardAPI volume makes downward API data available to applications. Within the volume, you can find the exposed data as read-only files in plain text format.**


> [!important]
> **Question: What are the four items you an monitor in Kubernetes?** 
> <br> **1. applications** 
> <br> **2. hosts**
> <br> **3. containers**
> <br> **4. Kubernetes**


> [!important]
> **Question: What is the default monitoring addon already included in Kubernetes?** 
> <br> **Metrics Server is the complementary  addon already included in Kubernetes.** 

> [!important]
> **Question: What is ‘Heapster’ in Kubernetes??** 
> <br> **A Heapster is a performance monitoring and metrics collection system for data collected by the Kublet.** 



## Other interview Questions

> [!important]
> **Question: What are federated clusters??** 
> <br> **The aggregation of multiple clusters that treat them as a single logical cluster refers to cluster federation. In this, multiple clusters may be managed as a single cluster..** 


> [!important]
> **Question: Give examples of recommended security measures for Kubernetes?** 
> <br> **Examples of standard Kubernetes security measures include defining resource quotas, support for auditing, restriction of etcd access, regular security updates to the environment, network segmentation, definition of strict resource policies, continuous scanning for security vulnerabilities, and using images from authorized repositories.** 


> [!important]
> **Question: How to monitor the Kubernetes cluster?** 
> <br> **Monitoring a Kubernetes cluster involves setting up various tools and practices to collect and analyze data on the cluster’s health, performance, and resource usage.** 


> [!important]
> **Question: How to get the central logs from POD?** 
> <br> **To collect central logs from Pods running in a Kubernetes cluster, you can use a centralized logging solution. One popular approach is to use the ELK Stack, which consists of three main components: Elasticsearch, Logstash (or Fluentd), and Kibana.** 


> [!important]
> **Question: What is a Network Policy in Kubernetes?** 
> <br> **Kubernetes Network Policies are an application-centric build that let you specify how pod is allowed to communicate with various network.** 


> [!important]
> **Question: What is a Helm chart, and how is it used?** 
> <br> **Helm utilizes a packaging format called charts, which are collection of files which describe the cohesive set of Kubernetes resources. Whether you are deploying a simple component, like a memcached pod, or a complex web app stack which involves HTTP servers, databases, caches, and more, all the files you need are contained in a single chart. Helm chart packages provide all the resources you need to deploy an application to a Kubernetes cluster, which involves YAML configuration files for secrets, services, deployments, and config maps that provide the app’s desired state.**


> [!important]
> **Question: Explain the concept of Pod Disruption Budgets.** 
> <br> **It is intended for application owners who want to build highly available applications and also serves as a guide for cluster administrators who are building automated cluster actions such as autoscaling and upgrades. Pod disruption budgets, or PDBs for short, are policies that specify the desired state of the cluster and the orchestrators’ attempt to maintain it. For PDBs, this consists of defining a maximum quantity of failed pods or the lowest number of pod replicas that must stay in the cluster at any given time.** 


> [!important]
> **Question: What are the different ways to provide external network connectivity to K8??** 
> <br> **1. Nodeport (it will expose one port on each node to communicate with it)** 
> <br> **2. Load balancers (L4 layer of TCP/IP protocol)** 
> <br> **3. Ingress (L7 layer of TCP/IP Protocol)** 

> [!important]
> **Question: How is Kubernetes different from Docker Swarm?** 
> <br> **Docker Swarm can’t do auto-scaling.** 
> <br> **Docker Swarm doesn’t have a GUI.** 
> <br> **Docker Swarm does automatic load balancing of traffic between containers in a cluster.** 

> [!important]
> **Question: How do you perform maintenance on the K8 node?** 
> <br> **kubectl cordon.** 
> <br> **kubectl drain -ignore-demon set.** 




## Kubernetes Components
When you deploy Kubernetes, you get a cluster.

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.

The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

### The Kubernetes cluster
A Kubernetes cluster is made up of at least one master node and one or more worker nodes. The master node makes up the control plane of a cluster and is responsible for scheduling tasks and monitoring the state of the cluster. The key advantage of the Kubernetes cluster is that it is not a physical cluster; rather, it is an abstraction. It does not matter whether the nodes in the cluster are virtual machines or bare-metal, on-premises, or on the cloud; Kubernetes can run containerized applications on any group of such machines. 



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

### Kubernetes Addons
Addons use Kubernetes resources (DaemonSet, Deployment, etc) to implement cluster features. Because these are providing cluster-level features, namespaced resources for addons belong within the kube-system namespace.



Selected addons are described below; for an extended list of available addons, please see Addons.

#### DNS
While the other addons are not strictly required, all Kubernetes clusters should have cluster DNS, as many examples rely on it.

Cluster DNS is a DNS server, in addition to the other DNS server(s) in your environment, which serves DNS records for Kubernetes services.

Containers started by Kubernetes automatically include this DNS server in their DNS searches.

#### Web UI (Dashboard)
Dashboard is a general purpose, web-based UI for Kubernetes clusters. It allows users to manage and troubleshoot applications running in the cluster, as well as the cluster itself.

#### Container Resource Monitoring
Container Resource Monitoring records generic time-series metrics about containers in a central database, and provides a UI for browsing that data.

#### Cluster-level Logging
A cluster-level logging mechanism is responsible for saving container logs to a central log store with search/browsing interface.

#### Network Plugins
Network plugins are software components that implement the container network interface (CNI) specification. They are responsible for allocating IP addresses to pods and enabling them to communicate with each other within the cluster.

## Objects In Kubernetes
Kubernetes objects are persistent entities in the Kubernetes system. Kubernetes uses these entities to represent the state of your cluster. Specifically, they can describe:

- What containerized applications are running (and on which nodes)
- The resources available to those applications
- The policies around how those applications behave, such as restart policies, upgrades, and fault-tolerance

A Kubernetes object is a "record of intent"--once you create the object, the Kubernetes system will constantly work to ensure that the object exists. By creating an object, you're effectively telling the Kubernetes system what you want your cluster's workload to look like; this is your cluster's desired state.

To work with Kubernetes objects—whether to create, modify, or delete them—you'll need to use the Kubernetes API. When you use the kubectl command-line interface, for example, the CLI makes the necessary Kubernetes API calls for you. You can also use the Kubernetes API directly in your own programs using one of the Client Libraries.

### Object spec and status
Almost every Kubernetes object includes two nested object fields that govern the object's configuration: the object spec and the object status. For objects that have a spec, you have to set this when you create the object, providing a description of the characteristics you want the resource to have: its desired state.

The status describes the current state of the object, supplied and updated by the Kubernetes system and its components. The Kubernetes control plane continually and actively manages every object's actual state to match the desired state you supplied.

For example: in Kubernetes, a Deployment is an object that can represent an application running on your cluster. When you create the Deployment, you might set the Deployment spec to specify that you want three replicas of the application to be running. The Kubernetes system reads the Deployment spec and starts three instances of your desired application--updating the status to match your spec. If any of those instances should fail (a status change), the Kubernetes system responds to the difference between spec and status by making a correction--in this case, starting a replacement instance.

For more information on the object spec, status, and metadata, see the Kubernetes API Conventions.

### Describing a Kubernetes object

When you create an object in Kubernetes, you must provide the object spec that describes its desired state, as well as some basic information about the object (such as a name). When you use the Kubernetes API to create the object (either directly or via kubectl), that API request must include that information as JSON in the request body. Most often, you provide the information to kubectl in a file known as a manifest. By convention, manifests are YAML (you could also use JSON format). Tools such as kubectl convert the information from a manifest into JSON or another supported serialization format when making the API request over HTTP.

Here's an example manifest that shows the required fields and object spec for a Kubernetes Deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80

```

One way to create a Deployment using a manifest file like the one above is to use the kubectl apply command in the kubectl command-line interface, passing the .yaml file as an argument. Here's an example:
```
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
```
The output is similar to this:
```
deployment.apps/nginx-deployment created
```

#### Object's Required fields
In the manifest (YAML or JSON file) for the Kubernetes object you want to create, you'll need to set values for the following fields:

- apiVersion - Which version of the Kubernetes API you're using to create this object
- kind - What kind of object you want to create
metadata - Data that helps uniquely identify the object, including a name string, UID, and optional namespace
- spec - What state you desire for the object
The precise format of the object spec is different for every Kubernetes object, and contains nested fields specific to that object. The Kubernetes API Reference can help you find the spec format for all of the objects you can create using Kubernetes.

For example, see the spec field for the Pod API reference. For each Pod, the .spec field specifies the pod and its desired state (such as the container image name for each container within that pod). Another example of an object specification is the spec field for the StatefulSet API. For StatefulSet, the .spec field specifies the StatefulSet and its desired state. Within the .spec of a StatefulSet is a template for Pod objects. That template describes Pods that the StatefulSet controller will create in order to satisfy the StatefulSet specification. Different kinds of objects can also have different .status; again, the API reference pages detail the structure of that .status field, and its content for each different type of object.

#### Object Server side field validation 
Starting with Kubernetes v1.25, the API server offers server side field validation that detects unrecognized or duplicate fields in an object. It provides all the functionality of kubectl --validate on the server side.

The kubectl tool uses the --validate flag to set the level of field validation. It accepts the values ignore, warn, and strict while also accepting the values true (equivalent to strict) and false (equivalent to ignore). The default validation setting for kubectl is --validate=true.

> Strict
Strict field validation, errors on validation failure
> Warn
Field validation is performed, but errors are exposed as warnings rather than failing the request
>Ignore
No server side field validation is performed

When kubectl cannot connect to an API server that supports field validation it will fall back to using client-side validation. Kubernetes 1.27 and later versions always offer field validation; older Kubernetes releases might not. If your cluster is older than v1.27, check the documentation for your version of Kubernetes.

#### Labels and Selectors
##### Labels
Labels are key/value pairs that are attached to objects such as Pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects. Labels can be attached to objects at creation time and subsequently added and modified at any time. Each object can have a set of key/value labels defined. Each Key must be unique for a given object.
```
apiVersion: v1
kind: Pod
metadata:
  name: label-demo
  labels:
    environment: production
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
Labels allow for efficient queries and watches and are ideal for use in UIs and CLIs. Non-identifying information should be recorded using annotations.

##### Selectors
Unlike names and UIDs, labels do not provide uniqueness. In general, we expect many objects to carry the same label(s).
Via a label selector, the client/user can identify a set of objects. The label selector is the core grouping primitive in Kubernetes.

#### Namespaces

In Kubernetes, namespaces provide a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces. Namespace-based scoping is applicable only for namespaced objects (e.g. Deployments, Services, etc.) and not for cluster-wide objects (e.g. StorageClass, Nodes, PersistentVolumes, etc.).


Initial namespaces
> Kubernetes starts with four initial namespaces:

##### default
Kubernetes includes this namespace so that you can start using your new cluster without first creating a namespace.

##### kube-node-lease
This namespace holds Lease objects associated with each node. Node leases allow the kubelet to send heartbeats so that the control plane can detect node failure.

##### kube-public
This namespace is readable by all clients (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.

##### kube-system
The namespace for objects created by the Kubernetes system.

```
kubectl get namespaces
kubectl get namespaces --show-labels

apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    name: production

kubectl create -f https://k8s.io/examples/admin/namespace-prod.yaml

or

kubectl create ns production

```

#### Annotations

You can use Kubernetes annotations to attach arbitrary non-identifying metadata to objects. Clients such as tools and libraries can retrieve this metadata.

> Attaching metadata to objects

You can use either labels or annotations to attach metadata to Kubernetes objects. Labels can be used to select objects and to find collections of objects that satisfy certain conditions. In contrast, annotations are not used to identify and select objects. The metadata in an annotation can be small or large, structured or unstructured, and can include characters not permitted by labels. It is possible to use labels as well as annotations in the metadata of the same object.

Annotations, like labels, are key/value maps:
```
apiVersion: v1
kind: Pod
metadata:
  name: annotations-demo
  annotations:
    imageregistry: "https://hub.docker.com/"
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80

```

#### Field Selectors
Field selectors let you select Kubernetes objects based on the value of one or more resource fields. Here are some examples of field selector queries:
```
metadata.name=my-service
metadata.namespace!=default
status.phase=Pending
```
This kubectl command selects all Pods for which the value of the status.phase field is Running:
```
kubectl get pods --field-selector status.phase=Running
```
> [!Note]
> Field selectors are essentially resource filters. By default, no selectors/filters are applied, meaning that all resources of the specified type are selected. This makes the kubectl queries kubectl get pods and kubectl get pods --field-selector "" equivalent.


#### Owners and Dependents  
In Kubernetes, some objects are owners of other objects. For example, a ReplicaSet is the owner of a set of Pods. These owned objects are dependents of their owner.



### Kubernetes Object Management

The kubectl command-line tool supports several different ways to create and manage Kubernetes objects.

#### Kubernetes object Management techniques
> [!important]
> A Kubernetes object should be managed using only one technique. Mixing and matching techniques for the same object results in undefined behavior.


| Management technique   | Example | Operates on	  | Recommended environment	  | Supported writers	  | Learning curve  |
| ------------- | ------------- | ------------- |------------- | ------------- | ------------- |
| Imperative commands	   | kubectl create deployment nginx --image nginx	    | Live objects	   | Development projects	   | 1+   | Lowest   |
| Imperative object configuration	   | kubectl create -f nginx.yaml	    | Individual files	   | Production projects	   | 1   | Moderate   |
| Declarative object configuration	   | kubectl apply -f configs/	    | Directories of files	   | Production projects	   | 1+   | Highest   |


##### Imperative commands 
> [!Note]
> When using imperative commands, a user operates directly on live objects in a cluster. The user provides operations to the kubectl command as arguments or flags. This is the recommended way to get started or to run a one-off task in a cluster. Because this technique operates directly on live objects, it provides no history of previous configurations.

```
Run an instance of the nginx container by creating a Deployment object:
kubectl create deployment nginx --image nginx
```



##### Imperative object configuration
> [!Note]
> In imperative object configuration, the kubectl command specifies the operation (create, replace, etc.), optional flags and at least one file name. The file specified must contain a full definition of the object in YAML or JSON format.
```
Create the objects defined in a configuration file:

kubectl create -f nginx.yaml
Delete the objects defined in two configuration files:

kubectl delete -f nginx.yaml -f redis.yaml
Update the objects defined in a configuration file by overwriting the live configuration:

kubectl replace -f nginx.yaml
```

##### Declarative object configuration
> [!Note]
> When using declarative object configuration, a user operates on object configuration files stored locally, however the user does not define the operations to be taken on the files. Create, update, and delete operations are automatically detected per-object by kubectl. This enables working on directories, where different operations might be needed for different objects.

```
Process all object configuration files in the configs directory, and create or patch the live objects. You can first diff to see what changes are going to be made, and then apply:

kubectl diff -f configs/
kubectl apply -f configs/
Recursively process directories:

kubectl diff -R -f configs/
kubectl apply -R -f configs/
```


## Pods
-	Pod is the smallest element in the Kubernetes.
-	The contains containers. Pods has an internal IP address assigned by the Kubernetes and it acts like a mini machine.
-	It can have multiple containers, but the containers must be doing a related job because it recycles together.
-	You can have 110 pods in one node max to 256. It means you can have max 265 IP allocations inside the node because each pods get one IP.




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
> [!Note]
> You can pass values to pod as environment or as volume.

#### Secrets:
A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. Such information might otherwise be put in a Pod specification or in a container image. Using a Secret means that you don't need to include confidential data in your application code.

> Uses for Secrets:

You can use Secrets for purposes such as the following:
-	Set environment variables for a container.
-	Provide credentials such as SSH keys or passwords to Pods.
-	Allow the kubelet to pull container images from private registries.

```
Imperative way
To  fetch security
Kubectl get secrets

To decode
echo -n 'dsfldfkdlsfkdl' | base64 --decode
 
From command line
Kubectl create secret generic mysecuritykeys 
--from-literal=App_Color=cGluaw==
--from-literal=App_DbName=TXlQcm9kRGI=
--from-literal=App_Color=UGFzc3dvcmQwMDAh
 
From a file
Kubectl create secret generic mysecuritykeys 
--from-file=myfile.properties
 
The contents of myfile.properties
App_Color: cGluaw==
App_DbName: TXlQcm9kRGI=
App_Color: UGFzc3dvcmQwMDAh
 
Declarative way
 
Create a definition file
apiVersion: v1
kind: Security
metadata:
  name: mysecuritykeys 
data:
 App_Color: cGluaw==
 App_DbName: TXlQcm9kRGI=
 App_Color: UGFzc3dvcmQwMDAh
 
Kubectl create -f mysecuritydefinition.yaml

# Passing Secret as volume

      volumeMounts:
        # name must match the volume name below
        - name: secret-volume
          mountPath: /etc/secret-volume
  # The secret data is exposed to Containers in the Pod through a Volume.
  volumes:
    - name: secret-volume
      secret:
        secretName: my-secret


```

#### ConfigMaps
A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.
A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.


```
Imperative way

Fetch configMap
Kubectl get configmaps

Create configmap from imperative command
Kubectl create configmap myconfigmap --from-literal=App_Color=pink --from- literal=App_DbName=MyProdDb --from-literal=App_Password=Password000!

Create configmap from a text file
Kubectl create configmap myconfigmap --from-file=myfile.properties
The contents of myfile.properties
App_Color: pink
App_DbName: MyProdDb
App_Color: Password000!


Declarative way
Create a definition file
apiVersion: v1
kind: ConfigMap
metadata:
name: myconfigmap
data:
App_Color: pink
App_DbName: MyProdDb
App_Password: Password000!

Kubectl create -f myconfigmap.yaml

# Passing configMap as Volume
    volumeMounts:
      - name: config-volume
        mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        # Provide the name of the ConfigMap containing the files you want
        # to add to the container
        name: special-config


```

#### Passing Values as Environment 
```
# Direct environment assign
- env:
- name: App_Color
  value: pink 
- name: App_DbName
  value: MyProdDB
- name: App_DbPassword
  value: Password000!

# Pass Config Map through environment
envFrom:
-       configMapRef: 
         name: myconfigmap 
 

# Pass Secret through environment
envFrom:
-    secretRef: 
      name: mysecuritykeys 


```

#### Passing config map and secrets as Volume
```
# Passing Secret as volume
      volumeMounts:
        # name must match the volume name below
        - name: secret-volume
          mountPath: /etc/secret-volume
  # The secret data is exposed to Containers in the Pod through a Volume.
  volumes:
    - name: secret-volume
      secret:
        secretName: my-secret

# Passing configMap as Volume
    volumeMounts:
      - name: config-volume
        mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        # Provide the name of the ConfigMap containing the files you want
        # to add to the container
        name: special-config


```

### Retrieving values from container
-	You can shell into the container using exec and display file content on same command
    - kubectl exec webapp cat /log/app.log
-	You can shell into the container and stay into the container until you exit the container manually.
    - kubectl exec -it envar-demo -- /bin/bash
    - Now you are inside the container and can run command for example printenv to disable all environment variables
    - root@envar-demo:/# printenv
    - To exit the shell, enter exit.



### Pod Health Monitoring
The kubelet can optionally perform and react to three kinds of probes on running containers:
#### Startup probes
-	Ideal for slow starting apps
-	Executes before Liveness and Readiness Probs
-	Startup probe execute only once

The kubelet uses startup probes to know when a container application has started. If such a probe is configured, liveness and readiness probes do not start until it succeeds, making sure those probes don't interfere with the application startup.

```
startupProbe:
  httpGet:
    httpHeaders:
      - name: User-Agent
        value: MyUserAgent


```


#### Liveness Probe
> [!note]
> Checks if app is still alive – if not kill and start new pod.

A developer can write a small code or page in the app to check if the app is still working and not causing a deadlock. It then then be used a livenessProbe to decide that is it better to restart a pod.
Indicates whether the container is running. If the liveness probe fails, the kubelet kills the container. For example, liveness probes could catch a deadlock, where an application is running, but unable to make progress. Restarting a container in such a state can help to make the application more available despite bugs.

##### liveness check using Command
-	Run a command against a container to check if it’s alive.
-	If not, delete the pod and start new
```
livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5

```

##### liveness check using HTTP request
-	Run a http request to your specially designed page and check if your app is alive.
-	If not, delete the pod and start a new pod.
```
livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
        httpHeaders:
        - name: Custom-Header
          value: Awesome
      initialDelaySeconds: 3
      periodSeconds: 3

```

##### liveness check using TCP probe
-	Open a socket to your container on the specified port.
-	If not, delete the pod and start a new pod.

```
livenessProbe:
      tcpSocket:
        port: 8080
     initialDelaySeconds: 15
      periodSeconds: 10

```

#### Readiness Probes

-	Checks if the pod is less busy for the incoming request.
-	If not, it passes the traffic to less busy pod.
-	It does not kill the pod.
-	It drops the pod from the load balancer backend pool.

It means that your pod is alive but busy serving other customer and unable to server more customer at the moment so direct the traffic to a free less busy pod.

It does not restart the pod but assign the request to another less busy pod.
Readiness probes to know when a container is ready to start accepting traffic otherwise the kubernetes will redirect the traffic to less busy pod.
```
# TCP Check
readinessProbe:
    tcpSocket:
    port: 8080
    initialDelaySeconds: 15
    periodSeconds: 10


# Command check
readinessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5

```


### Pod Scheduling - Assigning Pods to Nodes
Scheduler job is to assign a pod to a best node.
A scheduler is sitting on master node and watches for newly created Pods that have no Node assigned. For every Pod that the scheduler discovers, the scheduler becomes responsible for finding the best Node for that Pod to run on. Scheduler job is to Schedule, Preemption and Eviction.
-	Scheduling
    - In Kubernetes, scheduling refers to making sure that Pods are matched to Nodes so that the kubelet can run them. 
- Preemption 
    - Preemption is the process of terminating Pods with lower Priority so that Pods with higher Priority can schedule on Nodes. 
- Eviction 
    - Eviction is the process of terminating one or more Pods on Nodes.

#### Controlling Pod Scheduling
There are many ways you can control pod scheduling. The following plugins, enabled by default, implement one or more of these extension points:

##### NodeName
Checks if a Pod spec node name matches the current node. Extension points: filter.

##### nodeSelector
You can label your nodes for example ‘forntend’ and then use nodeSelector is pod definition to only assign these pods to a matching label. Kubernetes only schedules the Pod onto nodes that have each of the labels you specify.
Simple pod with manual schedule with node selector- Remember this can be one to many if you have multiple nodes available with same label.

> Commands
-	Label Node first
    - First label your nodes
    - Kubectl lable nodes node01 size=Large
    - Kubectl lable nodes node02 size=Large
    - Kubectl label nodes node03 size=Medium 
    - Kubectl label nodes node03 size=Small
-	Now add nodeSelector definition into pod spec
    -  nodeSelector: 
    -   size= Large

##### Affinity and anti-affinity
You can use the In, NotIn, Exists and DoesNotExist values in the operator field for Pod affinity and anti-affinity.

###### NodeAffinity
NodeAffinity is advance from of nodeSelector in which we can define a query to match the node. 
There are two types of node affinity:
-	required DuringSchedulingIgnoredDuringExecution
    - The scheduler can't schedule the Pod unless the rule is met. This functions like nodeSelector, but with a more expressive syntax.
-	preferred DuringSchedulingIgnoredDuringExecution:
    - The scheduler tries to find a node that meets the rule. If a matching node is not available, the scheduler still schedules the Pod.

> Commands
-	Label node first
    -	Kubectl lable nodes node01 size=Large
    -	Kubectl lable nodes node02 size=Large
    -	Kubectl label nodes node03 size=Medium 
    -	Kubectl label nodes node03 size=Small
-	Now add node affinity definition in pod definition
```
    nodeAffinity:       
    requiredDuringSchedulingIgnoredDuringExecution:
             nodeSelectorTerms:
                      - matchExpressions:
                                 - key: size
                                   operator: In             
                                   values:             
                                   - Large             
                                   - Medium
```
##### anti-affinity
Inter-pod affinity and anti-affinity rules take the form "this Pod should (or, in the case of anti-affinity, should not) run in an X if that X is already running one or more Pods that meet rule Y", where X is a topology domain like node, rack, cloud provider zone or region, or similar and Y is the rule Kubernetes tries to satisfy.


The anti-affinity rule specifies that the scheduler should try to avoid scheduling the Pod on a node if that node belongs to a specific zone where other Pods have been labeled with security=S2. For instance, if we have a cluster with a designated zone, let's call it "Zone R," consisting of nodes labeled with topology.kubernetes.io/zone=R, the scheduler should avoid assigning the Pod to any node within Zone R, as long as there is at least one Pod within Zone R already labeled with security=S2. Conversely, the anti-affinity rule does not impact scheduling into Zone R if there are no Pods with security=S2 labels.

##### Taint and Toleration
Implements taints and tolerations. Implements extension points: filter, preScore, score.
-	Taint
    -	Taints allow a node to repel a set of pods.
    -	Taint Effect
        -	Effect tells you what would happen for new and existing pods
            -	No Execute
                -	No new pod and also evict existing pod if not match the matching toleration.
            -	No Schedule
                -	Keep existing pod but no new pod if not matching toleration
            -	Prefer No Schedule
                -	Keep existing pod and try to also place pod with matching toleration.
    -	Commands
        -	Kubectl taint nodes node01 name=value:effect
        -	Add Taint: Kubectl taint nodes node01 spray=mortein:NoSchedule
        -	Get taint info: 
            -	kubectl describe node node01 | grep -i taints
            -	kubectl describe node node01
        -	Remove Taint: Kubectl taint nodes node01 spray=mortein:NoSchedule-
-	Toleration 
    -	Tolerations are applied to pods. Tolerations allow the scheduler to schedule pods with matching taints. Tolerations allow scheduling but don't guarantee scheduling:
    -	Add Toleration is pod spec
```    
	  tolerations:
    	  - key: "spray"
    	    operator: "Equal"
    	    value: "mortein"
    	    effect: "NoSchedule"
```
##### Pod CPU/Memory resource requirements
A Pod is scheduled to run on a Node only if the Node has enough CPU/Ram resources available to satisfy the Pod CPU and Memory request.
For example, in pod you define.
-	CPU
    -	Maximum
       -	limits:       cpu: "1"       
    -	Minimum
       -	requests:   cpu: "0.5"
-	Memory
    -	Maximum
        -	    limits:       memory: "1"       
    - Minimum
        -       requests:   memory: "0.5"+

##### By Scheduler Name
When multiple schedulers are available, you specify which scheduler to use
By default kubernetes has one builtin scheduler which is running as pod in kube-system name space. To create a new second scheduler:
•	You need to create/find a custom scheduler image and run as a pod. 
•	You then create a pod definition and under spec add [schedulerName:  my-scheduler].

##### ImageLocality
Favors nodes that already have the container images that the Pod runs. Extension points: score.

##### NodePorts
Checks if a node has free ports for the requested Pod ports. Extension points: preFilter, filter.
##### PodTopologySpread
Implements Pod topology spread. Extension points: preFilter, filter, preScore, score.
##### NodeUnschedulable
Filters out nodes that have .spec.unschedulable set to true. Extension points: filter.
##### NodeResourcesFit
Checks if the node has all the resources that the Pod is requesting. The score can use one of three rategies: LeastAllocated (default), MostAllocated and RequestedToCapacityRatio. Extension points: preFilter, filter, score.
##### NodeResourcesBalancedAllocation
Favors nodes that would obtain a more balanced resource usage if the Pod is scheduled there. Extension points: score.
##### VolumeBinding
Checks if the node has or if it can bind the requested volumes. Extension points: preFilter, filter, reserve, preBind, score.
Note: score extension point is enabled when VolumeCapacityPriority feature is enabled. It prioritizes the smallest PVs that can fit the requested volume size.
##### VolumeRestrictions
Checks that volumes mounted in the node satisfy restrictions that are specific to the volume provider. Extension points: filter.
##### VolumeZone
Checks that volumes requested satisfy any zone requirements they might have. Extension points: filter.
##### NodeVolumeLimits
Checks that CSI volume limits can be satisfied for the node. Extension points: filter.
##### EBSLimits
Checks that AWS EBS volume limits can be satisfied for the node. Extension points: filter.
##### GCEPDLimits
Checks that GCP-PD volume limits can be satisfied for the node. Extension points: filter.
##### AzureDiskLimits
Checks that Azure disk volume limits can be satisfied for the node. Extension points: filter.
##### InterPodAffinity
Implements inter-Pod affinity and anti-affinity. Extension oints: preFilter, filter, preScore, score.
##### PrioritySort
Provides the default priority based sorting. Extension points: queueSort.
##### DefaultBinder
Provides the default binding mechanism. Extension points: bind.
##### DefaultPreemption
Provides the default preemption mechanism. Extension points: postFilter.
You can also enable the following plugins, through the component config APIs, that are not enabled by default:
##### CinderLimits
Checks that OpenStack Cinder volume limits can be satisfied for the node. Extension points: filter.


## Kubernetes: Workloads



A workload is an application running on Kubernetes. Whether your workload is a single component or several that work together, on Kubernetes you run it inside a set of pods. In Kubernetes, a Pod represents a set of running containers on your cluster.

### Deployment
Deployment and ReplicaSet (replacing the legacy resource ReplicationController). Deployment is a good fit for managing a stateless application workload on your cluster, where any Pod in the Deployment is interchangeable and can be replaced if needed.

A Deployment provides declarative updates for Pods and ReplicaSets.
You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments. 
#### Rollout
When you are deploying you are actually doing a rollout. A Deployment's revision is created when a Deployment's rollout is triggered.

Everytime you create an update, it creates a rollout and gives it a rollout number.

##### Update/Deploy
A Deployment's rollout is triggered if and only if the Deployment's Pod template (that is, .spec.template) is changed, for example if the labels or container images of the template are updated. Other updates, such as scaling the Deployment, do not trigger a rollout.

##### Rolling Back a Deployment 
Sometimes, you may want to rollback a Deployment; for example, when the Deployment is not stable, such as crash looping. By default, all of the Deployment's rollout history is kept in the system so that you can rollback anytime you want (you can change that by modifying revision history limit).


#### Deployment Strategy
.spec.strategy specifies the strategy used to replace old Pods by new ones. .spec.strategy.type can be "Recreate" or "RollingUpdate". 
"RollingUpdate" is the default value.

##### RollingUpdate
Pods are killed one-by-one when .spec.strategy.type== RollingUpdate.
##### Recreate
All existing Pods are killed before new ones are created when .spec.strategy.type==Recreate.

##### Commands
-	Kubectl get deployments OR kubectl get deploy
	- List the existing deployment of cluster and on default name space
-	Kubectl describe deployment mydeployment
	- Describe the deployment 
-	kubectl run --generator=deployment/v1beta1 nginx --image=nginx --dry-run --replicas=4 -o yaml > newfile.yaml
	- Creates a new deployment yaml file with the name nginx and with nginx image with 4 replicas
-	Kubectl get deployment mydeployment -o yaml > filename.yaml
	- Creates a deployment file with existing deployment object.
-	kubectl run --generator=deployment/v1beta1 webapp --image=kodekloud/webapp-color --replicas=3
	- Creates a deployment without creating a yaml file
-	kubectl set image deployment/frontend simple-webapp=kodekloud/webapp-2
	- Edit an existing deployment image
-	Updates and Rollback
	- Kubectl create -f deploymentfile.yaml
	  - Create a deployment from a file
	- Kubectl create/apply -f deploymentfile.yaml
	  - Apply changes to already deployed objects
	- kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1 --record
	  - Imperative command which directly modify image in a deployment object
	- Kubectl get deployment fontend -o yaml > deployment.yaml
	  - This will save the deployment definition into a yaml file, you can edit this file and make required changes and then run kubectl create/apply -f deployment.yaml 
	- kubectl rollout status deployment.v1.apps/nginx-deployment
	  - shows current deployment status
	- kubectl rollout history deployment.v1.apps/nginx-deployment
	  - shows rollout history
	- kubectl rollout undo deployment.v1.apps/nginx-deployment
	  - Now you’ve decided to undo the current rollout and rollback to the previous revision:
	- kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision=2
	  - Alternatively, you can rollback to a specific revision by specifying it with --to-revision:
	- kubectl scale deployment.v1.apps/nginx-deployment --replicas=10
	  - You can scale a Deployment by using scale 


### StatefulSet
StatefulSet lets you run one or more related Pods that do track state somehow. For example, if your workload records data persistently, you can run a StatefulSet that matches each Pod with a PersistentVolume. Your code, running in the Pods for that StatefulSet, can replicate data to other Pods in the same StatefulSet to improve overall resilience.
### DaemonSet
DaemonSet defines Pods that provide facilities that are local to nodes. Every time you add a node to your cluster that matches the specification in a DaemonSet, the control plane schedules a Pod for that DaemonSet onto the new node. Each pod in a DaemonSet performs a job similar to a system daemon on a classic Unix / POSIX server. A DaemonSet might be fundamental to the operation of your cluster, such as a plugin to run cluster networking, it might help you to manage the node, or it could provide optional behavior that enhances the container platform you are running.
### Job and CronJob 
Job and CronJob provide different ways to define tasks that run to completion and then stop. You can use a Job to define a task that runs to completion, just once. You can use a CronJob to run the same Job multiple times according a schedule.

## Kubernetes: Application types
Kubernetes can have two types of applications. 
### Stateless
By default, the pods are stateless so when the pod deletes its data also deletes. You still can link the pods to a volume (which is attached to node) but this can be deleted if node is deleted.
-	Mostly stateless
-	Volumes (see section in storage)
### Stateful Set
It’s a solution for a stateful application.
It scaleup gracefully and also scale down gracefully.
You also need to define a headless service in satefullset.
It expose all pods in the set with a servicename with -0, -1 and so on at the end.
The StatefulSet provisions a PersistentVolumeClaim in  a single yaml file.
To help prevent data loss, PersistentVolumes and PersistentVolumeClaims are not deleted when a StatefulSet is deleted
The StatefulSet automatically replaces Pods that fail or are evicted from their nodes, and automatically associates new Pods with the storage resources. You define PV and PVC in single files and the kind od definition is StatefulSet.
If the pods is deleted, it does not recreate  storage, it just create new pods and automatically associate it to the storage resources.
A stateful application requires that its state be saved or persistent. 
Stateful applications use persistent storage, such as persistent volumes, to save data for use by the server or by other users.
Statefulset is different from Deployment because in statefulset the pod are create in sequence. First pod name becomes name-0 and so on so you can refer each pod by name.
	
#### Kubernetes solution:  Option 1 > StatfulSet:  
For stateful applications using ReadWriteOnce volumes, use StatefulSets. StatefulSets are designed to deploy stateful applications and clustered applications that save data to persistent storage, such as Compute Engine persistent disks. StatefulSets are suitable for deploying Kafka, MySQL, Redis, ZooKeeper, and other applications needing unique, persistent identities and stable hostnames.
	
#### Kubernetes solution:  Option 2 > KubeDirector:  
KubeDirector is an open source project designed to make it easy to run complex stateful scale-out application clusters on Kubernetes. KubeDirector is built using the custom resource definition (CRD) framework and leverages the native Kubernetes API extensions and design philosophy. 
KubeDirector provides the following capabilities:
-	The ability to run non-cloud native stateful applications on Kubernetes without modifying the code. In other words, it’s not necessary to decompose these existing applications to fit a microservices design pattern.
-	Native support for preserving application-specific configuration and state.
-	An application-agnostic deployment pattern, minimizing the time to onboard new stateful applications to Kubernetes
### 3rd Party Solution:
You can also use 3rd party to host your database, this allows you to take the database management complexity out of Kubernetes and only use Kubernetes to manage your application management like auto scale and controlled deployment.
There are many option you can use like, this is useful because these 3rd party is responsible to take backup of your services.
-	A web hosting company to host your database
-	Azure database etc


## Kubernetes: Scaling


> Scaling
Kubernetes autoscaling is a feature that allows a cluster to automatically increase or decrease the number of nodes, or adjust pod resources, in response to demand. When demand increases, the cluster can add nodes or provide more resources to  pods, and when demand decreases, Kubernetes can remove nodes or assign less resources to a pod. This can help optimize resource usage and costs, and also improve performance.
Types of scaling in Kubernetes.

### ReplicaSets
It makes sure that the desired number of pods always running.
Used to create a specified quantity of identical pods. It hardcode the number of pods must be running. A ReplicaSet (RS) is a Kubernetes object that ensures there is always a stable set of running pods for a specific workload. The ReplicaSet configuration defines a number of identical pods required, and if a pod is evicted or fails, creates more pods to compensate for the loss.
In Kubernetes, you do not create ReplicaSets directly. ReplicaSets are set up as part of the Deployment construct.

> Commands
-	kubectl create deployment my-dep --image=nginx --replicas=3
-	This will create a deployment but if you just need to create a replicaset then same the command output in file and replace Kind: Deployment to Kind Replicaset and delete strategy tag.
    - kubectl create deployment mydep --image=nginx --replicas=1 --dry-run=client -o yaml > rs.yaml
    - Edit rs.yaml
    - Replace Deployment to Replicaset
    - Remove Strategy 
    - Kubectl apply -f rs.yaml
-	Kubectl get replicasets OR 
-	Kubectl get rs
	- List all replicasets available in the cluster
-	Kubectl describe rs my-replica-set-1
  - Describe the replica set object, here you can see the image use to create the containers and events
-	Kubectl get rs my-replica-set-1 -o yaml > myreplica.yaml
  - Creates a yaml file from existing replica, handy if you wish to change anything is replica like image and re-deploy
-	Kubectl scale rs my-replicaset-1 --replicas=5
  - Update or downgrand number of replicas in a replicaset
-	kubectl delete rs replicaset-1
  - Deletes the replica set


### Horizontal Pod Autoscaler (HPA)
HPA dynamically add pods depending on the load on your application. It’s kind of a dynamic replicaset based on CPU usage. 
Automatically adds or removes pod replicas dynamically depending on HPA definition. Horizontal Pod Autoscaler (HPA) automatically adds or removes pod replicas. This makes it possible to automatically manage workload scaling when the level of application usage changes.
Commands
-	creates a pod and define that the cpu requirements
  -	kubectl run php-apache --image=k8s.gcr.io/hpa-example --requests=cpu=200m --limits=cpu=500m --expose --port=80
-	create a HPA and define the if the pod exceeds 50% CPU then create a new pod upto 3 max.
  -	kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=3
-	Get HPA status
  -	Kubectl get hpa


### Cluster Autoscaler
Automatically adds or removes nodes in a cluster based on all pods’ requested resources & HPA. Cluster Autoscaler works with Horizonal Pod Scaler to automatically adds or removes nodes in a cluster based on demand. It seeks unschedulable pods and tries to consolidate pods that are currently deployed on only a few nodes. It loops through these two tasks constantly.

### Vertical Pod Autoscaler (VPA)
You install a vertical pod scaler which automatically change your pod CPU/Memory limited based on it’s usage both up and down.
Vertical Pod Autoscaler (VPA) frees users from the necessity of setting up-to-date resource limits and requests for the containers in their pods. When configured, it will set the requests automatically based on usage and thus allow proper scheduling onto nodes so that appropriate resource amount is available for each pod. It will also maintain ratios between limits and requests that were specified in initial containers configuration.
It can both down-scale pods that are over-requesting resources, and also up-scale pods that are under-requesting resources based on their usage over time.
Automatically adds or adjusts CPU and memory reservations for your pods. The Vertical Pod Autoscaler automatically adds or adjusts CPU and memory reservations for your pods. It uses live usage data to set limits on container resources.


## Kubernetes: Services, Load Balancing, and Networking

### The Kubernetes network model


Every Pod in a cluster gets its own unique cluster-wide IP address. This means you do not need to explicitly create links between Pods and you almost never need to deal with mapping container ports to host ports.
-	Kubernetes do not let docker run the networking hence the container never gets an IP in Kubernetes
-	The first thing Kubernetes does is it kills the docker networking.
This creates a clean, backwards-compatible model where Pods can be treated much like VMs or physical hosts from the perspectives of port allocation, naming, service discovery, load balancing, application configuration, and migration.

### Rules
Kubernetes imposes the following fundamental requirements on any networking implementation
-	pods can communicate with all other pods on same node and any other node without NAT (Network address translation). It means all pods should be able to talk to other pods inside a cluster.
-	agents on a node (e.g. system daemons, kubelet) can communicate with all pods on that node and all pods should be able to talk to all nodes.

### The Law
-	Kubernetes wants all pods/Nodes IPs to be unique.
-	But Kubernetes does not provide a way to do it.
-	You need to make sure you control IP uniqueness.
-	For this you can use 3rd party tool called CNI (Container Network Interface) API tools.


#### CNI (Container Network Interface) API tools
-	Container Network Interface (CNI) is a framework for dynamically configuring networking resources.
-	Examples are 
  - WeaveNet, Cisco, Flannel, VMware, NSX, Cilium
  - Flannel, by default, flannel uses CIDR 10.244.0.0/16 to allocate smaller subnets with 10.244.X.0/24 mask to each node, and Pods will use IP addresses from one of these subnets allocated to a given node.


### DNS for Services and Pods


Kubernetes wants you to choose your DNS service like coreDNS.
DNS is nothing but to resolve and name url (FQDN) to an ip endpoint resource.
When you create a Service, it creates a corresponding DNS entry. This entry is of the form <service-name>.<namespace-name>.svc.cluster.local, which means that if a container only uses <service-name>, it will resolve to the service which is local to a namespace. This is useful for using the same configuration across multiple namespaces such as Development, Staging and Production. If you want to reach across namespaces, you need to use the fully qualified domain name (FQDN).
-	As we know the pods are expose by a service
  -	A service is in a name space
    -	The name space is in cluster 
 
So to achieve to access a service means you access to pods. The DNS will look like this
 
> Service-name.namespace-name.svc.cluster-name.local
 
This will translate into a service endpoint.
  
You can also reach the pod with its IP with dashes in the middle for example your pod ip is 10.244.2.10
 
> 10-244-2-10.namespace-name.pod.cluster-name.local



#### coreDNS
Core-DNS is the internal DNS service used by the cluster's resources. It's the component which registers pod/service DNS names. This is considered a critical component of Kubernetes.

-	coreDNS runs as a pod is master and act Kubernetes DNS service. 
-	When you create a new pod or service, it records its endpoint IP and access url so it can resolve it.
-	It has a local storage where it keeps the ip-table 
-	When you type any url which is in fact a FQDN for example  https://Service-name.namespace-name.svc.cluster-name.local it resolves it to it's IP and let you reach to a resource.
-	Commands
  -	How to find the FQDN of a service
  -	Run
  -	$ host web-service
  -	Here you have a service name web-service
  -	 > web-service-default.svc.cluster.local has address 10.97.206.196



#### External DNS
External-DNS is an add-on component which allows the deployment of DNS records in external DNS services such as Azure DNS zone based on the host field within ingress resources deployed to the cluster.

#### Cert Manager
It runs as a pod as an external service to install and renew SSL

### Service


Service is a method for exposing a network application that is running as one or more Pods in your cluster.
Service is bound to whole cluster and not a single node. Services are not created on single node or assigned to a single node. Services are cluster wide object.
Services are virtual object which created cluster wide scope and get an IP address. 
You can’t attach a service to a node, services are attached to a cluster.
The Service API lets you expose an application running in Pods to be reachable from outside your cluster.
Ingress provides extra functionality specifically for exposing HTTP applications, websites and APIs.
Gateway API is an add-on that provides an expressive, extensible, and role-oriented family of API kinds for modelling service networking.


> Service type
For some parts of your application (for example, frontends) you may want to expose a Service onto an external IP address, one that's accessible from outside of your cluster.
Kubernetes Service types allow you to specify what kind of Service you want.
The available type values and their behaviors are:


#### ClusterIP (default service) (Internet to k8s cluster)
It crease a Cluster virtual IP so multiple clusters can talk to each other. Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default that is used if you don't explicitly specify a type for a Service. You can expose the Service to the public internet using an Ingress or a Gateway.
This default Service type assigns an IP address from a pool of IP addresses that your cluster has reserved for that purpose. Several of the other types for Service build on the ClusterIP type as a foundation. If you define a Service that has the .spec.clusterIP set to "None" then Kubernetes does not assign an IP address.
Commands
-	kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yam
  -	Create a Service named redis-service of type ClusterIP to expose pod redis on port 6379
  -	This will automatically use the pod's labels as selectors
-	kubectl create service clusterip redis --tcp=6379:6379 --dry-run -o yaml
  -	This will not use the 


#### NodePort (To Internet through a Worker Node)
Used to map a node port to an pod port using [selector]. Selector is used to filter the pods with some sort of criteria like app name.
Exposes the Service on each Node's IP at a static port (the NodePort). To make the node port available, Kubernetes sets up a cluster IP address, the same as if you had requested a Service of 
> type: ClusterIP
If you set the type field to NodePort, the Kubernetes control plane allocates a port from a range specified by --service-node-port-range flag (default: 30000-32767). Each node proxies that port (the same port number on every Node) into your Service. Your Service reports the allocated port in its .spec.ports[*].nodePort field.
Using a NodePort gives you the freedom to set up your own load balancing solution, to configure environments that are not fully supported by Kubernetes, or even to expose one or more nodes' IP addresses directly.
Commands:
-	kubectl expose pod nginx --port=80 --name nginx-service --dry-run -o yaml
  -	This will automatically use the pod's labels as selectors, but you cannot specify the node port.
-	kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run -o yaml
  -	This will not use the pods labels as selectors

#### LoadBalancer (To Internet)
Exposes the Service (nodePort) externally using an external load balancer. Kubernetes does not directly offer a load balancing component; you must provide one, or you can integrate your Kubernetes cluster with a cloud provider.
> type: LoadBalancer
On cloud providers which support external load balancers, setting the type field to LoadBalancer provisions a load balancer for your Service. The actual creation of the load balancer happens asynchronously, and information about the provisioned balancer is published in the Service's .status.loadBalancer field.
Traffic from the external load balancer is directed at the backend Pods. The cloud provider decides how it is load balanced.
To implement a Service of type: LoadBalancer, Kubernetes typically starts off by making the changes that are equivalent to you requesting a Service of type: NodePort. The cloud-controller-manager component then configures the external load balancer to forward traffic to that assigned node port.
Command
kubectl create service loadbalancer lb  --tcp=5123:8080 --dry-run=client -o yaml


#### ExternalName (From Internet)

It is used to connect the pods to an external MySQL database sitting on Azure through a CNAME.
Maps the Service to the contents of the externalName field (for example, to the hostname api.foo.bar.example). The mapping configures your cluster's DNS server to return a CNAME record with that external hostname value. No proxying of any kind is set up.
> type: ExternalName
Services of type ExternalName map a Service to a DNS name, not to a typical selector such as my-service or cassandra. You specify these Services with the spec.externalName parameter.
This Service definition, for example, maps the my-service Service in the prod namespace to my.database.example.com:
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: prod
spec:
  type: ExternalName
  externalName: my.database.example.com
```


### Ingress (To Internet)


Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. 
Traffic routing is controlled by rules defined on the Ingress resource.
Make your HTTP (or HTTPS) network service available using a protocol-aware configuration mechanism, that understands web concepts like URIs, hostnames, paths, and more. The Ingress concept lets you map traffic to different backends based on rules you define via the Kubernetes API.
Ingress provides extra functionality specifically for exposing HTTP applications, websites and APIs.
Ingress Service
 
It's like a level 7 load balance same as application gateway which can pass the control to another service based on the url for example.
 
You can say it’s a smart load balancer
  
#### Simple fanout
A fan-out configuration routes traffic from a single IP address to more than one Service, based on the HTTP URI being requested. An Ingress allows you to keep the number of load balancers down to a minimum. For example, a setup like:

> Abc.com/foo	service1:80

> Abc.com/bar	service2:80

```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: simple-fanout-example
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: abc.com
    http:
      paths:
      - path: /foo
        backend:
          serviceName: service1
          servicePort: 80
      - path: /bar
        backend:
          serviceName: service2
          servicePort: 80

```

#### Sub domain level ingress 
Name-based virtual hosts support routing HTTP traffic to multiple host names at the same IP address.
> foo.abc.com	service1:80
> bar.abc.com	service2:80
```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: name-virtual-host-ingress
spec:
  rules:
  - host: foo.abc.com
    http:
      paths:
      - backend:
          serviceName: service1
          servicePort: 80
  - host: bar.abc.com
    http:
      paths:
      - backend:
          serviceName: service2
          servicePort: 80

```
> Sub domains with default www
> foo.abc.com	service1:80
> bar.abc.com	service2:80
> www.abc.com
> Service3:80
> Xyz.abcd.com	Service3:80
```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: name-virtual-host-ingress
spec:
  rules:
  - host: foo.abc.com
    http:
      paths:
      - backend:
          serviceName: service1
          servicePort: 80
  - host: bar.abc.com
    http:
      paths:
      - backend:
          serviceName: service2
          servicePort: 80
  - http: # for all other sub domain including www
      paths:
      - backend:
          serviceName: service3
          servicePort: 80

```
 
-	To deploy this file run
-	Kubectl create -f filename.yaml
-	Or
-	kubectl create ingress <ingress-name> --rule="host/path=service:port"
-	To fetch
-	Kubectl get Ingress


#### Ingress Controllers
In order for an Ingress to work in your cluster, there must be an ingress controller running. You need to select at least one ingress controller and make sure it is set up in your cluster. This page lists common ingress controllers that you can deploy.
-	AKS Application Gateway Ingress Controller is an ingress controller that configures the Azure Application Gateway.
-	The Application Gateway Ingress Controller (AGIC) is a Kubernetes application, which makes it possible for Azure Kubernetes Service (AKS) customers to leverage Azure's native Application Gateway L7 load-balancer to expose cloud software to the Internet. AGIC monitors the Kubernetes cluster it's hosted on and continuously updates an Application Gateway, so that selected services are exposed to the Internet.
-	AKS Application Gateway Ingress Controller helps eliminate the need to have another load balancer/public IP address in front of the AKS cluster and avoids multiple hops in your datapath before requests reach the AKS cluster. Application Gateway talks to pods using their private IP address directly and doesn't require NodePort or KubeProxy services. This capability also brings better performance to your deployments.


### Headless Services
Used in Stateful set.
Sometimes you don't need load-balancing and a single Service IP. In this case, you can create what are termed headless Services, by explicitly specifying "None" for the cluster IP address (.spec.clusterIP).
You can use a headless Service to interface with other service discovery mechanisms, without being tied to Kubernetes' implementation.
For headless Services, a cluster IP is not allocated, kube-proxy does not handle these Services, and there is no load balancing or proxying done by the platform for them.

### Gateway API
Gateway API is a family of API kinds that provide dynamic infrastructure provisioning and advanced traffic routing. Gateway API is an add-on containing API kinds that provide dynamic infrastructure provisioning and advanced traffic routing.
### EndpointSlices
The EndpointSlice API is the mechanism that Kubernetes uses to let your Service scale to handle large numbers of backends, and allows the cluster to update its list of healthy backends efficiently.
### Network Policies
If you want to control traffic flow at the IP address or port level (OSI layer 3 or 4), NetworkPolicies allow you to specify rules for traffic flow within your cluster, and also between Pods and the outside world. Your cluster must use a network plugin that supports NetworkPolicy enforcement.


## Kubernetes: Storage

### Volumes
- Problems 
   - Container state is not saved so all of the files that were created or modified during the lifetime of the container are lost. During a crash, kubelet restarts the container with a clean state.
   - Another problem occurs when multiple containers are running in a Pod and need to share files. It can be challenging to setup and access a shared filesystem across all of the containers.
- So we need a temporary solution which lets the pods share data among it’s container and if restarts, atleast get the previous state saves to reload.
- The solution is volumes
- The volume type defines where data is stored and when it’s data will be deleted
- Volume Types
   - 1. emptyDir
        - emptyDir is a pod level storage
        - All containers in the Pod can read and write the same files in the emptyDir volume
        - When a Pod is removed from a node for any reason, the data in the emptyDir is deleted permanently.
   - 2. hostPath
        - hostPath is node level storage (not for production)
        - A hostPath volume mounts a file or directory from the host node's filesystem into your Pod.
        - If node is deleted the hostpath data is deleted.
   - 3. downwardAPI
        - A downwardAPI volume makes downward API data available to applications. Within the volume, you can find the exposed data as read-only files in plain text format.

### Persistent Volumes
You have to define the storage first and then use it.
Sometimes you wish to save the data permanently. The answer is Persistent Volumes.
-	A PersistentVolume (PV) is a piece of storage in the cluster.
-	Commands
  -	kubectl get pv
  -	kubectl describe pv pv0001
  -	kubectl get pvc

### Ways a pod can attach to a PV

#### Directly 
-	Direct assign a volume to a pod without claim
-	Create a PV
-	Assign a PV name is pod definition

#### Persistence Volume Claim
-	A PersistentVolumeClaim (PVC) is a request for storage by a user/pod.
-	In the claim you define how much space you need.
-	The claim then binds to available PV. It only binds to a PV which can satisfy the claim needs.
-	It attaches a pod to a required available persistence storage.
-	The name of the PV is not known to a pod.

#### Storage Classes

- The storage dynamically provisioned/creates a storage to satisfy a PersistentVolumeClaim (PVC).
- It creates the PV automatically.
- Its an on demand PV
- In StorageClass definition you define the storage provider as ‘provisioner’  for example Google or Azure.
- Create Persistent Volume on Demand through StorageClass
```
  apiVersion: storage.k8s.io/v1
  kind: StorageClass
  metadata:
    name: azurefile
  provisioner: kubernetes.io/azure-file
  parameters:
    skuName: Standard_LRS
    location: eastus
    storageAccount: azure_storage_account_name
  ```
- Now you can create a PVC with our StorageClass name.

## Kubernetes: Security
This section of the Kubernetes documentation aims to help you learn to run workloads more securely, and about the essential aspects of keeping a Kubernetes cluster secure.

Kubernetes includes several APIs and security controls, as well as ways to define policies that can form part of how you manage information security.

### Control plane protection 
A key security mechanism for any Kubernetes cluster is to control access to the Kubernetes API.
Users access the Kubernetes API using kubectl, client libraries, or by making REST requests. Both human users and Kubernetes service accounts can be authorized for API access. When a request reaches the API, it goes through several stages like Authentication and Authorization

#### Authentication

Kubernetes do not provide user creation; it wants to create a user through following options. Kubernetes can create service account so you can use CICD tools to deploy apps. 
To inspect which authorization mode is configured in your cluster, run the following command
kubectl describe pod kube-apiserver-master -n kube-system | grep authorization-mode
-	Files - Username and password
    -	Create a user csv file and configure it with the api server
-	Files - Username and tokens like bearer tokens also known as service account.
    -	Create a user csv file and register it with api server
-	Certificates
    -	Create a Certificate Signing Request object in kubernetes with user provided certificate and approve it
    -	Kubectl create -f robert-certificate-signing-request.yaml
    -	kubectl certificate approve robert 
-	3rd Party access management like Microsoft Entra ID using API webhooks
-	Service Account (for CICD like azure devops pipeline, Jenkins) 
    - A service account is a type of non-human account that, in Kubernetes, provides a distinct identity in a Kubernetes cluster. Application Pods, system components, and entities inside and outside the cluster can use a specific ServiceAccount's credentials to identify as that ServiceAccount. This identity is useful in various situations, including authenticating to the API server or implementing identity-based security policies.
    - Commands
      - Kubectl get serviceaccount 
      -	Kubectl get sa
      -	Kubectl create serviceaccount dashboard-sa
      -	Configure Service Accounts for Pods

```
      apiVersion: v1
      kind: Pod
      metadata:
        name: my-pod
      spec:
        serviceAccountName: dashboard-sa
```

#### Authorization 
The Kubernetes API server may authorize a request using one of several authorization modes:

- Node - A special-purpose authorization mode that grants permissions to kubelets based on the pods they are scheduled to run. To learn more about using the Node authorization mode, see Node Authorization.
- ABAC - Attribute-based access control (ABAC) defines an access control paradigm whereby access rights are granted to users through the use of policies which combine attributes together. The policies can use any type of attributes (user attributes, resource attributes, object, environment attributes, etc). To learn more about using the ABAC mode, see ABAC Mode.
- RBAC - Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within an enterprise. In this context, access is the ability of an individual user to perform a specific task, such as view, create, or modify a file. To learn more about using the RBAC mode, see RBAC Mode. To enable RBAC, start the apiserver with --authorization-mode=RBAC.
By default all roles are denied by kubernetes so you never define a deny role, you allow create and assign a allow role.
  - Role
    - A Role can only be used to grant access to resources within a single namespace.
    - A Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in.
    - RoleBinding
    - Because a role is namespace bound so RoleBinding grants permissions within a specific namespace.
  - ClusterRole
    - A ClusterRole can be used to grant the same permissions as a Role, but because they are cluster-scoped, they can also be used to grant access to:
      - cluster-scoped resources (like nodes)
      - non-resource endpoints (like “/healthz”)
      - namespaced resources (like pods) across all namespaces (needed to run kubectl get pods --all-namespaces, for example)
    - ClusterRoleBinding
      - Because a cluster role is cluster wide so ClusterRoleBinding grants that access cluster-wide.

- Webhook - A WebHook is an HTTP callback: an HTTP POST that occurs when something happens; a simple event-notification via HTTP POST. A web application implementing WebHooks will POST a message to a URL when certain things happen. To learn more about using the Webhook mode, see Webhook Mode.


- AlwaysAllow
This mode allows all requests, which brings security risks. Use this authorization mode only if you do not require authorization for your API requests (for example, for testing).
- AlwaysDeny
This mode blocks all requests. Use this authorization mode only for testing.
- Node
A special-purpose authorization mode that grants permissions to kubelets based on the pods they are scheduled to run. To learn more about the Node authorization mode, see Node Authorization.


> **Azure RBAC to authorize access to the AKS resource**
With the Azure RBAC integration, AKS will use a Kubernetes Authorization webhook server so you can manage Microsoft Entra integrated Kubernetes cluster resource permissions and assignments using Azure role definition and role assignments.

**Roles and ClusterRoles**

> **Roles**

Before assigning permissions to users with Kubernetes RBAC, you'll define user permissions as a Role. Grant permissions within a namespace using roles.
Kubernetes roles grant permissions; they don't deny permissions.
![aks RB fundamentals](https://github.com/wasi-shah/Docker-AKS/assets/51749920/4f39c4be-5568-41cd-a7d9-3f593de0a768)

```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-full-access-role
  namespace: dev
rules:
- apiGroups: ["", "extensions", "apps"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["batch"]
  resources:
  - jobs
  - cronjobs
  verbs: ["*"]

```



> **RoleBindings**

Assign roles to users for a given namespace using RoleBindings. With RoleBindings, you can logically segregate a single AKS cluster, only enabling users to access the application resources in their assigned namespace.
![AKS Roles mapping](https://github.com/wasi-shah/Docker-AKS/assets/51749920/69a57ab0-8588-4ada-83d1-0b857c4d5232)


> [!Note]
> To obtain the object ID follow these setps
> #################### 1  - Create Azure AD Group
```
##### Get Azure AKS Cluster Id
AKS_CLUSTER_ID=$(az aks show --resource-group aks-rg3 --name aksdemo3 --query id -o tsv)
echo $AKS_CLUSTER_ID

##### Create Azure AD Group
DEV_AKS_GROUP_ID=$(az ad group create --display-name devaksteam --mail-nickname devaksteam --query id -o tsv)   
echo $DEV_AKS_GROUP_ID
```
> #################### 2 Assign Azure Kubernetes Service Cluster User Role to Group
```
##### Create Role Assignment 
az role assignment create \
  --assignee $DEV_AKS_GROUP_ID \
  --role "Azure Kubernetes Service Cluster User Role" \
  --scope $AKS_CLUSTER_ID
```
> #################### 3 Create user 
```
##### Create Dev User
DEV_AKS_USER_OBJECT_ID=$(az ad user create \
  --display-name "AKS Dev1" \
  --user-principal-name aksdev1@your-sub-domain.onmicrosoft.com \
  --password @AKSDemo123 \
  --query objectId -o tsv)
echo $DEV_AKS_USER_OBJECT_ID 
```
> #################### 4 Associate user to the group
```
##### Associate Dev User to Dev AKS Group
az ad group member add --group devaksteam --member-id $DEV_AKS_USER_OBJECT_ID
```
#################### Now you can create a role in AKS cluster and use the same DEV_AKS_USER_OBJECT_ID as Name
```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-access-rolebinding
  namespace: dev
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: dev-user-full-access-role
subjects:
- kind: Group
  namespace: dev
  #####name: groupObjectId ##### Your Azure AD Group Object ID: devaksteam
  name: "4123d819-9ed6-460b-8321-39f02157536b" 

```



> **ClusterRoles**

To grant permissions across the entire cluster or to cluster resources outside a given namespace, you can instead use ClusterRoles.
A ClusterRole grants and applies permissions to resources across the entire cluster, not a specific namespace.
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  ##### "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
    - apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get", "list", "watch"]

```

> **ClusterRoleBinding**

With a ClusterRoleBinding, you bind roles to users and apply to resources across the entire cluster, not a specific namespace. This approach lets you grant administrators or support engineers access to all resources in the AKS cluster.
```
 apiVersion: rbac.authorization.k8s.io/v1
##### This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager ##### Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io

```


### Secrets 
The Secret API provides basic protection for configuration values that require confidentiality.

### NetworkPolicies
> Can be used to restrict ingress and egress traffic for a workload.
If you want to control traffic flow at the IP address or port level for TCP, UDP, and SCTP protocols, then you might consider using Kubernetes NetworkPolicies for particular applications in your cluster
An example NetworkPolicy might look like this:
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: test-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24
    - namespaceSelector:
        matchLabels:
          project: myproject
    - podSelector:
        matchLabels:
          role: frontend
    ports:
    - protocol: TCP
      port: 6379
  egress:
  - to:
    - ipBlock:
        cidr: 10.0.0.0/24
    ports:
    - protocol: TCP
      port: 5978


```
### LimitRanges 
> Limit resource consumption for a namespace.

By default, containers run with unbounded compute resources on a Kubernetes cluster. Using Kubernetes resource quotas, administrators (also termed cluster operators) can restrict consumption and creation of cluster resources (such as CPU time, memory, and persistent storage) within a specified namespace. Within a namespace, a Pod can consume as much CPU and memory as is allowed by the ResourceQuotas that apply to that namespace. As a cluster operator, or as a namespace-level administrator, you might also be concerned about making sure that a single object cannot monopolize all available resources within a namespace.

A LimitRange is a policy to constrain the resource allocations (limits and requests) that you can specify for each applicable object kind (such as Pod or PersistentVolumeClaim) in a namespace.

A LimitRange provides constraints that can:

- Enforce minimum and maximum compute resources usage per Pod or Container in a namespace.
- Enforce minimum and maximum storage request per PersistentVolumeClaim in a namespace.
- Enforce a ratio between request and limit for a resource in a namespace.
- Set default request/limit for compute resources in a namespace and automatically inject them to Containers at runtime.
- A LimitRange is enforced in a particular namespace when there is a LimitRange object in that namespace.

For example, you define a LimitRange with this manifest:

```
apiVersion: v1
kind: LimitRange
metadata:
  name: cpu-resource-constraint
spec:
  limits:
  - default: # this section defines default limits
      cpu: 500m
    defaultRequest: # this section defines default requests
      cpu: 500m
    max: # max and min define the limit range
      cpu: "1"
    min:
      cpu: 100m
    type: Container

```
### ResourceQuotas
> ResourceQuotas limit resource consumption for a namespace.
When several users or teams share a cluster with a fixed number of nodes, there is a concern that one team could use more than its fair share of resources.

Resource quotas are a tool for administrators to address this concern.

A resource quota, defined by a ResourceQuota object, provides constraints that limit aggregate resource consumption per namespace. It can limit the quantity of objects that can be created in a namespace by type, as well as the total amount of compute resources that may be consumed by resources in that namespace.










## Monitoring in Kubernetes



 In traditional, host-centric infrastructure, we were used to monitoring only two layers: applications and the hosts running them. Now with containers in the middle and Kubernetes itself needing to be monitored, there are four different components to monitor and collect metrics from.

> [!note] 
>There are four different components to monitor and collect metrics from

- applications
- the hosts
- containers 
- Kubernetes



### Metrics to monitor

Whether you use Heapster data or a monitoring tool integrating with Kubernetes and its different APIs, there are several key types of metrics that need to be closely tracked:

- Running pods and their deployments
- Usual resource metrics such as CPU, memory usage, and disk I/O
- Container-native metrics
- Application metrics for which a service discovery feature in your monitoring tool is essential 
All these metrics should be aggregated using Kubernetes labels and correlated with events from Kubernetes and container technologies.



### Where Kubernetes metrics come from
The Kubernetes ecosystem includes two complementary add-ons for aggregating and reporting valuable monitoring data from your cluster: Metrics Server and kube-state-metrics.
#### Metrics Server
Metrics Server collects resource usage statistics from the kubelet on each node and provides aggregated metrics through the Metrics API. Metrics Server stores only near-real-time metrics in memory, so it is primarily valuable for spot checks of CPU or memory usage, or for periodic querying by a full-featured monitoring service that retains data over longer timespans.

#### kube-state-metrics
kube-state-metrics is a service that makes cluster state information easily consumable. Whereas Metrics Server exposes metrics on resource usage by pods and nodes, kube-state-metrics listens to the Control Plane API server for data on the overall status of Kubernetes objects (nodes, pods, Deployments, etc.), as well as the resource limits and allocations for those objects. It then generates metrics from that data that are available through the Metrics API.

## Viewing monitoring data/metrics

- Tool : Heapster - Heapster monitors the kubernetes cluster
- Tool : Grafana/Prometheus - A dashboard to view pod metrics by namespace and pod names. 
- Tool : Istio - Istio is an open-source service mesh implementation that manages communication and data sharing between microservices
  - 1. Traffic Control:
The main feature of Istio is its role in traffic management. It controls the flow of traffic between services by implementing routing rules through its Envoy proxies.
  - 2. Observability:
The platform controls and observes all incoming and outgoing traffic within the network layer. Therefore, it collects large amounts of data that provide useful insight for future development.
  - 3. Security:
While developers secure the application from potential threats and hacks, Istio authorizes, authenticates, and encrypts all internal communication. Pods and services talk to each other and transfer data under Istio’s policies.
  - 4. It's a Service Mesh:
  A service mesh is a dedicated infrastructure layer that controls service-to-service communication over a network.
- Tool : Datadog - graphing tool - 
- Tool : Kentik - Understand your Kubernetes networks, from container, to data center, to public cloud.
- Tool : NetFlow - Service communication monitoring in Kubernetes
- Tool : Cilium - Visualize Network Traffic
- Your own solution: Attach a storage backend using PV to save application log
- Your own solution: Integrate your own a monitoring tool with the different components of your infrastructure


#### Monitoring Cluster level (using Metrics Server)
You can monitor nodes on cluster using 
- Kubectl top Nodes 
- Kubectl top pods

#### Monitoring Application Level
This is to monitor log written by your application
- Reading pod log
   - Kubectl logs pod-name
- Reading pod outer log
   - kubectl logs ${POD_NAME} ${CONTAINER_NAME}
- Reading log written by an app inside its container storage
   - The application stores logs at location /log/app.log. View the logs.
   - You can shell into the container using exec
   - kubectl exec webapp -- cat /log/app.log
- Listing folders inside the container
   - kubectl exec webapp -- ls
- Reading Events
   - Kubectl get events


## Kubernetes Cluster Providers

IaaS/Kubernetes Provider	
- Alibaba Cloud 
- Amazon Web Services 
- Google Cloud Platform 
- Huawei Cloud  
- IBM Cloud 
- Microsoft Azure 
- Oracle Cloud Infrastructure 
- VMware vSphere  

## Kubernetes Tools
### Command Tools
- Kubectl : The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs.

