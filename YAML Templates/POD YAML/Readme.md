# PODs with YAML

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
