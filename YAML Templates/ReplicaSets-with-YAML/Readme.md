# ReplicaSets with YAML
## ReplicaSet
A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods
## replicaset-definition.yml
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: myapp2-rs
spec:
  replicas: 3 # 3 Pods should exist at all times.
  selector:  # Pods label should be defined in ReplicaSet label selector
    matchLabels:
      app: myapp2
  template:
    metadata:
      name: myapp2-pod
      labels:
        app: myapp2 # Atleast 1 Pod label should match with ReplicaSet Label Selector
    spec:
      containers:
      - name: myapp2
        image: stacksimplify/kubenginx:2.0.0
        ports:
          - containerPort: 80
```

## Create ReplicaSet
```
# Create ReplicaSet
kubectl apply -f 02-replicaset-definition.yml

# List Replicasets
kubectl get rs

# Delete a pod
# ReplicaSet immediately creates the pod.
# List Pods
kubectl get pods
# Delete Pod
kubectl delete pod <Pod-Name>

# List Pods again and you will notice that the pods are crated again.
kubectl get pods

```

## Create LoadBalancer Service for ReplicaSet
```
apiVersion: v1
kind: Service
metadata:
  name: replicaset-loadbalancer-service
spec:
  type: LoadBalancer 
  selector: 
    app: myapp2 
  ports: 
    - name: http
      port: 80
      targetPort: 80
```
## Create LoadBalancer Service for ReplicaSet & Test
```
# Create LoadBalancer Service
kubectl apply -f 03-replicaset-LoadBalancer-servie.yml

# List LoadBalancer Service
kubectl get svc

# Access Application
http://<Load-Balancer-Service-IP>

```
