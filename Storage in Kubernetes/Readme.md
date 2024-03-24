# Types of storage in Kubernetes
* Volumes
* Persistance Volumes
* Storage Class


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
* Direct Mount without claim
   - Create a PV
   - Assign a PV name inside the pod definition
* Through claim with default available storage
  -	A PersistentVolumeClaim (PVC) is a request for storage by a user/pod.
  -	In the claim you define how much space you need.
  -	The claim then binds to available PV. It only binds to a PV which can satisfy the claim needs.
  -	It attaches a pod to a required available persistence storage.
  -	The name of the PV is not known to a pod.

* Through claim with storage class
  - Define a storage class
  -	Create a Presestance Volume Claim and mention the storage class name.
  -	In the claim you define how much space you need.
  -	The claim then binds to the mentioned storage class. 
  -	It attaches a pod to a required available persistence storage.
  -	The name of the PV is not known to a pod.
 
