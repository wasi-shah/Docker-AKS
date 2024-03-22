# PODs with YAML
Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

A Pod (as in a pod of whales or pea pod) is a group of one or more containers, with shared storage and network resources, and a specification for how to run the containers. A Pod's contents are always co-located and co-scheduled, and run in a shared context. A Pod models an application-specific "logical host": it contains one or more application containers which are relatively tightly coupled. In non-cloud contexts, applications executed on the same physical or virtual machine are analogous to cloud applications executed on the same logical host.

As well as application containers, a Pod can contain init containers that run during Pod startup. You can also inject ephemeral containers for debugging a running Pod.

## POD Yaml basic empty template
* Pod definition yaml file
```
apiVersion: 
kind: 
metadata:

spec:
```
## Create a Simple Pod Definition using YAML
```
apiVersion: v1 # String
kind: Pod # String
metadata: # Dictionary
  name: myapp-pod
  labels: # Dictionary
    app: myapp  # Key value pairs and used in service definition selector field or matchLabels field 
spec:
  containers: # List
    - name: myapp # container name
      image: nginx #container image
      ports: 
        - containerPort: 80 # container port / used as target port in services
```
## Create Pod command
  ```
  # Create Pod
  kubectl create -f 02-pod-definition.yml
  [or]
  kubectl apply -f 02-pod-definition.yml
  #List Pods
  kubectl get pods
  ```

## Create a LoadBalancer Service
```
apiVersion: v1
kind: Service
metadata:
  name: myapp-pod-loadbalancer-service  # Name of the Service
spec:
  type: LoadBalancer
  selector:
  # Loadbalance traffic across Pods matching this label selector
    app: myapp
  # Accept traffic sent to port 80    
  ports: 
    - name: http
      port: 80    # Service Port
      targetPort: 80 # Container Port

```
## Create LoadBalancer Service for Pod
```
# Create Service
kubectl apply -f 03-pod-LoadBalancer-service.yml

# List Service
kubectl get svc

# Access Application
http://<Load-Balancer-Service-IP>

```
