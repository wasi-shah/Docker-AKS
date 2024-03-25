# Access Node and Pod details inside docker container 
Use env to pass Node and Pod meta data to docker container using Downward API.
In Kubernetes, there are two ways to expose Pod and container fields to a running container:
* as environment variables
* as files in a downwardAPI volume

Together, these two ways of exposing Pod and container fields are called the downward API.

# Available fields 
Only some Kubernetes API fields are available through the downward API. This section lists which fields you can make available.

You can pass information from available Pod-level fields using fieldRef. At the API level, the spec for a Pod always defines at least one Container. You can pass information from available Container-level fields using resourceFieldRef.

# Information available via fieldRef
For some Pod-level fields, you can provide them to a container either as an environment variable or using a downwardAPI volume. The fields available via either mechanism are:

```metadata.name```
the pod's name

```metadata.namespace```
the pod's namespace

```metadata.uid```
the pod's unique ID

```metadata.annotations['<KEY>']```
the value of the pod's annotation named <KEY> (for example, metadata.annotations['myannotation'])

```metadata.labels['<KEY>']```
the text value of the pod's label named <KEY> (for example, metadata.labels['mylabel'])

# The following information is available through environment variables but not as a downwardAPI volume fieldRef:
```spec.serviceAccountName```
the name of the pod's service account

```spec.nodeName```
the name of the node where the Pod is executing

```status.hostIP```
the primary IP address of the node to which the Pod is assigned

```status.hostIPs```
the IP addresses is a dual-stack version of status.hostIP, the first is always the same as status.hostIP. The field is available if you enable the PodHostIPs feature gate.

```status.podIP```
the pod's primary IP address (usually, its IPv4 address)

```status.podIPs```
the IP addresses is a dual-stack version of status.podIP, the first is always the same as status.podIP

# The following information is available through a downwardAPI volume fieldRef, but not as environment variables:

```metadata.labels```
all of the pod's labels, formatted as label-key="escaped-label-value" with one label per line
```metadata.annotations```
all of the pod's annotations, formatted as annotation-key="escaped-annotation-value" with one annotation per line

# Information available via resourceFieldRef
These container-level fields allow you to provide information about requests and limits for resources such as CPU and memory.

```resource: limits.cpu```
A container's CPU limit

```resource: requests.cpu```
A container's CPU request

```resource: limits.memory```
A container's memory limit

```resource: requests.memory```
A container's memory request

```resource: limits.hugepages-*```
A container's hugepages limit

```resource: requests.hugepages-*```
A container's hugepages request

```resource: limits.ephemeral-storage```
A container's ephemeral-storage limit

```resource: requests.ephemeral-storage```
A container's ephemeral-storage request

# POD: Use NGINX Docker image to display POD and Node meta data details
Create a pod using Nginx 
```
kubectl apply f  kubernetes-pod-to-container.yaml
```

Expose a pod using LoadBalancer service
```
kubectl expose pod kubernetes-to-container --type=LoadBalancer --port=80 --name=pod-lb
```

Access the webpage using external IP
```
kubectl get svc
```

Browse
```
http://EXTERNAL-IP/
```

Or display nginx default html file contents on termianl without creating LoadBalancer service
```
kubectl exec -it kubernetes-to-container -c=nginx  -- cat /usr/share/nginx/html/index.html
Result:
MY_POD_IP:10.224.0.104
MY_POD_NAME:kubernetes-to-container
MY_POD_NAMESPACE:default
MY_NODE_NAME:aks-agentpool-37305774-vmss000000
MY_POD_SERVICE_ACCOUNT:default
```

kubernetes-pod-to-container.yaml file that used pod and node meta data as env variables
```
apiVersion: v1
kind: Pod
metadata:
  name: kubernetes-to-container
  labels:
   app: kubernetes-to-container
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: workdir
      mountPath: /usr/share/nginx/html
  # These containers are run during pod initialization
  initContainers:
  - name: install
    image: busybox:1.28
    env:
      - name: MY_NODE_NAME
        valueFrom:
          fieldRef:
            fieldPath: spec.nodeName
      - name: MY_POD_NAME
        valueFrom:
          fieldRef:
            fieldPath: metadata.name
      - name: MY_POD_NAMESPACE
        valueFrom:
          fieldRef:
            fieldPath: metadata.namespace
      - name: MY_POD_IP
        valueFrom:
          fieldRef:
            fieldPath: status.podIP
      - name: MY_POD_SERVICE_ACCOUNT
        valueFrom:
          fieldRef:
            fieldPath: spec.serviceAccountName          
    command: 
    - 'sh'
    - '-c'
    - 'echo MY_POD_IP:$(MY_POD_IP)  MY_POD_NAME:$(MY_POD_NAME)  MY_POD_NAMESPACE:$(MY_POD_NAMESPACE)  MY_NODE_NAME:$(MY_NODE_NAME)  MY_POD_SERVICE_ACCOUNT:$(MY_POD_SERVICE_ACCOUNT) > /work-dir/index.html'
    volumeMounts:
    - name: workdir
      mountPath: "/work-dir"
  dnsPolicy: Default
  volumes:
  - name: workdir
    emptyDir: {}
```
# Deployment with replicas: Use NGINX Docker image deployment through deployment to display POD and Node meta data details
Create a pod using Nginx 
```
kubectl apply f  kubernetes-deployment-to-container.yaml
```

Expose a pod using LoadBalancer service
```
kubectl expose pod kubernetes-to-container --type=LoadBalancer --port=80 --name=deployment-lb
```

Access the webpage using external IP
```
kubectl get svc
```

Browse - open multiple browser and you will get different pod name  
```
http://EXTERNAL-IP/
```
# Expose Pod Information to Containers Through Files
> [!TIP]
> This page shows how a Pod can use a downwardAPI volume, to expose information about itself to containers running in the Pod. A downwardAPI volume can expose Pod fields and container fields.
> https://kubernetes.io/docs/tasks/inject-data-application/downward-api-volume-expose-pod-information/


# Clean Up!
```
kubectl delete pod kubernetes-to-container
kubectl delete svc pod-lb

kubectl delete deployment nginx-deployment
kubectl delet svc deployment-lb
```


