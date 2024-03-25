# Types of storage in Kubernetes
* Volumes
* Persistance Volumes
* Storage Class

## Kubetctl commands
```
# List Storage Classes
kubectl get sc

# List PVC
kubectl get pvc 

# List PV
kubectl get pv

# List pods
kubectl get pods

# Connect to MYSQL Database
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -pdbpassword11

# Verify usermgmt schema got created which we provided in ConfigMap
mysql> show schemas;

```

## Volumes
Volume is a temporary solution which lets the pods share data among their containers and if restarts, at least get the previous state saves to reload.
> [!NOTE]
>	Container state is not saved so all of the files that were created or modified during the lifetime of the container are lost. During a crash, kubelet restarts the container in a clean state.
> The volume type defines where data is stored and when it’s data will be deleted

### Volume Types
> [!NOTE]
> The volume type defines where data is stored and when it’s data will be deleted
#### emptyDir
* emptyDir is a pod level storage
*	All containers in the Pod can read and write the same files in the emptyDir volume
*	When a Pod is removed from a node for any reason, the data in the emptyDir is deleted permanently.
> [!WARNING]
> When a Pod is removed from a node for any reason, the data in the emptyDir is deleted permanently.
```
# Create a pod with an init container.
# The init container checks if the file is there and if exists, then the normal container works fine.
apiVersion: v1
kind: Pod
metadata:
  name: init-test-pod
spec:
  volumes:
  - name: mydir
    emptyDir: {}

  initContainers:
  - name: init-myservice
    image: busybox:1.28
    command: ['sh', '-c', 'mkdir /workdir; echo>/workdir/test.txt']
    volumeMounts:
    - name: mydir
      mountPath: /workdir

  containers:
  - name: myapp-container
    image: alpine
    command: ['sh', '-c', 'if [ -f /workdir/test.txt ]; then sleep 99999; fi']
    volumeMounts:
    - name: mydir
      mountPath: /workdir

```

#### hostPath
*	hostPath is node-level storage (not for production)
*	A hostPath volume mounts a file or directory from the host node's filesystem into your Pod.
*	If node is deleted the hostpath data is deleted.
> [!WARNING]
> If node is deleted the hostpath data is deleted.
```
# Define a pod and in the same definition assign it to a Volume (no claim involved in this setup)

apiVersion: v1
kind: Pod
metadata:
  name: webapp
spec:
  containers:
  - name: event-simulator
    image: kodekloud/event-simulator
    env:
    - name: LOG_HANDLERS
      value: file
    volumeMounts:
    - mountPath: /log
      name: log-volume

  volumes:
  - name: log-volume
    hostPath: # node level storage
      # directory location on host
      path: /var/log/webapp
      # this field is optional
  type: Directorymaster

```
#### downwardAPI
downwardAPI volume makes downward API data available to applications. Within the volume, you can find the exposed data as read-only files in plain text format.

## Persistent Volumes
* The lifecycle of Persistent Volumes is independent of any individual Pod that uses the PV.
* If you delete the pod/node the PV still lives until you delete the cluster.
 
### Types of storage attachment 
### Direct Mount without claim
   - Create a PV
   - Assign a PV name inside the pod definition
### Through claim with default available storage class in AKS (AZURE Disk)
  -	A PersistentVolumeClaim (PVC) is a request for storage by a user/pod.
  -	In the claim you define how much space you need.
  -	The claim then binds to available PV. It only binds to a PV which can satisfy the claim needs.
  -	It attaches a pod to a required available persistence storage.
  -	The name of the PV is not known to a pod.
#### Attach a pod to a volume through the claim with the default Azure Storage class managed-premium
##### Step 1: Create a Persistent Volume Claim for a default Azure Disk mounted on AKS Cluster
> [!IMPORTANT]
> **managed-premium ** is already available in AKS as a storage class which lets you create and use Azure disk

> [!CAUTION]
> **Azure Disk**
> 
> **Only one pod can connect to Azure Disk at a time so use Azure Files instead.**

> [!Note]
> **Azure Files**
> 
> Azure Files offers fully managed file shares in the cloud that are accessible via the industry standard Server Message Block (SMB) protocol, Network File System (NFS) protocol, and Azure Files REST API.
> An Azure file share is a convenient place for cloud applications to write their logs, metrics, and crash dumps. Logs can be written by the application instances via the File REST API, and developers can access them by mounting the file share on their local machine. 

> [!NOTE]
> PVC name is **azure-managed-disk-pvc**

````
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: azure-managed-disk-pvc
spec:
  accessModes:
  - ReadWriteOnce
  storageClassName: managed-premium
  resources:
    requests:
      storage: 5Gi    
````
##### Step 2: Create and then attach a claim to a deployment
> [!NOTE]
> A deployment is attached to a PVC name  **azure-managed-disk-pvc**
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec: 
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  strategy:
    type: Recreate 
  template: 
    metadata: 
      labels: 
        app: mysql
    spec: 
      containers:
        - name: mysql
          image: mysql:5.6
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: dbpassword11
          ports:
            - containerPort: 3306
              name: mysql    
          volumeMounts:
            - name: mysql-persistent-storage
              mountPath: /var/lib/mysql    
            - name: usermanagement-dbcreation-script
              mountPath: /docker-entrypoint-initdb.d #https://hub.docker.com/_/mysql Refer Initializing a fresh instance                                            
      volumes: 
        - name: mysql-persistent-storage
          persistentVolumeClaim:
            claimName: azure-managed-disk-pvc
        - name: usermanagement-dbcreation-script
          configMap:
            name: usermanagement-dbcreation-script
```

### Through claim with your own custom storage class (AZURE Disk)
  - Define a storage class
  -	Create a Presestance Volume Claim and mention the storage class name.
  -	In the claim you define how much space you need.
  -	The claim then binds to the mentioned storage class. 
  -	It attaches a pod to a required available persistence storage.
  -	The name of the PV is not known to a pod.
#### Attach a pod to a volume through the claim with the custom Azure Storage class managed-premium
##### Step 1: Create/Extend your own storage class
> [!NOTE]
> What is a Storage Classes
> *	The storage dynamically provisioned/creates storage to satisfy a PersistentVolumeClaim (PVC).
> *	It creates the PV automatically.
> *	It is an on-demand PV
> *	In StorageClass definition you define the storage provider as a ‘provisioner’  for example Google or Azure.

> [!NOTE]
> PVC name is **managed-premium-retain-sc**
> Provisioner is **provisioner: kubernetes.io/azure-disk**
> reclaim policy is **reclaimPolicy: Retain** which means if you delete the cluster the disk keeps alive.
```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: managed-premium-retain-sc
provisioner: kubernetes.io/azure-disk
reclaimPolicy: Retain  # Default is Delete, recommended is retain
volumeBindingMode: WaitForFirstConsumer # Default is Immediate, recommended is WaitForFirstConsumer
allowVolumeExpansion: true  
parameters:
  storageaccounttype: Premium_LRS # or we can use Standard_LRS
  kind: managed # Default is shared (Other two are managed and dedicated)

```
##### Step 2: Create a Persistent Volume Claim for a default Azure Disk mounted on AKS Cluster
> [!NOTE]
> the storage class name is **managed-premium-retain-sc** which is your own storage class.

````
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: azure-managed-disk-pvc
spec:
  accessModes:
  - ReadWriteOnce
  storageClassName: managed-premium-retain-sc
  resources:
    requests:
      storage: 5Gi     
````
##### Step 3: Create and then attach a claim to a deployment
> [!NOTE]
> A deployment is attached to a PVC name  **azure-managed-disk-pvc**
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec: 
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  strategy:
    type: Recreate 
  template: 
    metadata: 
      labels: 
        app: mysql
    spec: 
      containers:
        - name: mysql
          image: mysql:5.6
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: dbpassword11
          ports:
            - containerPort: 3306
              name: mysql    
          volumeMounts:
            - name: mysql-persistent-storage
              mountPath: /var/lib/mysql    
            - name: usermanagement-dbcreation-script
              mountPath: /docker-entrypoint-initdb.d #https://hub.docker.com/_/mysql Refer Initializing a fresh instance                                            
      volumes: 
        - name: mysql-persistent-storage
          persistentVolumeClaim:
            claimName: azure-managed-disk-pvc
        - name: usermanagement-dbcreation-script
          configMap:
            name: usermanagement-dbcreation-script
```

# Azure Files

## With default AKS-created storage classes only below two options are available for us.
Standard_LRS - standard locally redundant storage (LRS)
Premium_LRS - premium locally redundant storage (LRS)
Important Note: Azure Files support premium storage in AKS clusters that run Kubernetes 1.13 or higher, minimum premium file share is 100GB

## Custom Storage Class
We can create our own custom storage class with desired permissions
Standard_LRS - standard locally redundant storage (LRS)
Standard_GRS - standard geo-redundant storage (GRS)
Standard_ZRS - standard zone redundant storage (ZRS)
Standard_RAGRS - standard read-access geo-redundant storage (RA-GRS)
Premium_LRS - premium locally redundant storage (LRS)
kube-manifests-v2: AKS defined default storage class

## Create a custom Azure Files storage class
```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: my-azurefile-sc
provisioner: kubernetes.io/azure-file
mountOptions:
  - dir_mode=0777
  - file_mode=0777
  - uid=0
  - gid=0
  - mfsymlinks
  - cache=strict
parameters:
  skuName: Standard_LRS
```

Create PVC against your Azure Files custom storage class
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-azurefile-pvc
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: my-azurefile-sc
  resources:
    requests:
      storage: 5Gi
```
