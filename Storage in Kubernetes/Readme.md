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
# Create a pod with an init container. the init container checks if the file is there and if there, then the normal container works fine.
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
