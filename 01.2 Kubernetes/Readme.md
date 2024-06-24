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


### Pod Scheduling
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
Commands
-	Label Node first
    - First label your nodes
    - Kubectl lable nodes node01 size=Large
    - Kubectl lable nodes node02 size=Large
    - Kubectl label nodes node03 size=Medium 
    - Kubectl label nodes node03 size=Small
-	Now add nodeSelector definition into pod spec
    -  nodeSelector: 
    -   size= Large

##### NodeAffinity
NodeAffinity is advance from of nodeSelector in which we can define a query to match the node. 
There are two types of node affinity:
•	required DuringSchedulingIgnoredDuringExecution
o	The scheduler can't schedule the Pod unless the rule is met. This functions like nodeSelector, but with a more expressive syntax.
•	preferred DuringSchedulingIgnoredDuringExecution:
o	The scheduler tries to find a node that meets the rule. If a matching node is not available, the scheduler still schedules the Pod.
Commands
•	Label node first
o	Kubectl lable nodes node01 size=Large
o	Kubectl lable nodes node02 size=Large
o	Kubectl label nodes node03 size=Medium 
o	Kubectl label nodes node03 size=Small
•	Now add node affinity definition in pod definition
o	affinity:     nodeAffinity:       requiredDuringSchedulingIgnoredDuringExecution:         nodeSelectorTerms:         - matchExpressions:           - key: size             operator: In             values:             - Large             - Medium
##### Taint and Toleration
Implements taints and tolerations. Implements extension points: filter, preScore, score.
•	Taint
o	Taints allow a node to repel a set of pods.
o	Taint Effect
	Effect tells you what would happen for new and existing pods
	No Execute
	No new pod and also evict existing pod if not match the matching toleration.
	No Schedule
	Keep existing pod but no new pod if not matching toleration
	Prefer No Schedule
	Keep existing pod and try to also place pod with matching toleration.
o	Commands
	Kubectl taint nodes node01 name=value:effect
	Add Taint: Kubectl taint nodes node01 spray=mortein:NoSchedule
	Get taint info: 
	kubectl describe node node01 | grep -i taints
	kubectl describe node node01
	Remove Taint: Kubectl taint nodes node01 spray=mortein:NoSchedule-
•	Toleration 
o	Tolerations are applied to pods. Tolerations allow the scheduler to schedule pods with matching taints. Tolerations allow scheduling but don't guarantee scheduling:
o	Add Toleration is pod spec
	  tolerations:
	  - key: "spray"
	    operator: "Equal"
	    value: "mortein"
	    effect: "NoSchedule"

##### Pod CPU/Memory resource requirements
A Pod is scheduled to run on a Node only if the Node has enough CPU/Ram resources available to satisfy the Pod CPU and Memory request.
For example, in pod you define.
o	CPU
o	Maximum
	limits:       cpu: "1"       
o	Minimum
	requests:   cpu: "0.5"
o	Memory
o	Maximum
	limits:       memory: "1"       
o	Minimum
	requests:   memory: "0.5"+

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

