# Create a client/server app in Kubernetes using ClusterIP
* Frontend app - An nginx app which connects to the backend app using proxy_pass
* Frontend Loadbalancer service: To display the result on the web browser through public IP
* Backend app - An nginx app which displays Node and Pod details
* Cluster IP (for backend app): To allow the frontend app to communicate to the backend app

## Create a backend nginx app
> [!WARNING]
> The backend nginx app uses [proxy_pass http://my-backend-service:8080;] in default.conf to access the backend app.
```
# default.conf
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    #location / {
    #   root   /usr/share/nginx/html;
    #    index  index.html index.htm;
    #}

    location / {
    # Update your backend application Kubernetes Cluster-IP Service name  and port below
    # proxy_pass http://<Backend-ClusterIp-Service-Name>:<Port>;  
    proxy_pass http://my-backend-service:8080;
    }

    #error_page  404              /404.html;
    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```
### Docker file copies the default config to ngix config location
```
# Dockerfile
FROM nginx
COPY default.conf /etc/nginx/conf.d
```
### Create a frontend docker image
```
docker build -t cip_frontend_nginx .
docker tag cip_frontend_nginx wasishah102/cip_frontend_nginx
docker push wasishah102/cip_frontend_nginx
```
## Prepare for the backend app
The backend app uses two containers 
* busybox:1.28 to use env variables and save it to index files
* nginx to display the index file - this will then be read by the frontend app using Cluster IP

```
# backend-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
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

## Publish the app in Kubernetes
* Frontend app
* Frontend LoadBalancer
* Backend app
* Backend Cluster IP

### App plublishing order 
If you create a frontend app first then it will stuck in 'Error' state because of the following error 
```
host not found in upstream "my-backend-service" in /etc/nginx/conf.d/default.conf:16
```
> [!TIP]
> So it is important to publish the app in the correct sequence. 

### First: Create a backend app deployment
Deploy backend app using backend-deployment.yaml

Expose the backend app through Cluster IP
```
kubectl apply -f backend-deployment.yaml
kubectl get deploy
kubectl expose deployment  backend-deplyment  --port=8080 --target-port=80 --name=my-backend-service
kubectl get deploy
Result should be
NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
backend-deployment   3/3     3            3           8s
```
### Create Cluster IP and expose backend-deployment on port 8080
> [!TIP]
> Our frontend app is trying to connect to the backend using [proxy_pass http://my-backend-service:8080;], so it is important to name your cluster IP service 'my-backend-service' and port to '8080'.
```
kubectl expose deployment  backend-deployment  --port=8080 --target-port=80 --name=my-backend-service
```
Now you have the backend ready.
### Deploy frontend app
```
# Create pod
kubectl run frontend --image=wasishah102/cip_frontend_nginx

# Expose the frontend using LoadBalancer
kubectl expose pod frontend  --type=LoadBalancer --port=80 --target-port=80 --name=frontendlb

#get IP
kubectl get svc
## Now you can browse using frontend public IP address
```
> [!CAUTION]
> If you delete the [my-backend-service] then the frontend will stop working, even if you recreate the [my-backend-service] the frontend will still not work because the binding only happens on creation, hence the pod is bound to the previous [my-backend-service] Cluster IP.
> You now have to recreate a pod to connect to the new [my-backend-service] Cluster IP.

## Clean up.
```
kubectl delete pod frontend
kubectl delete deployment backend-deployment
kubectl delete svc my-backend-service
kubectldelete svc frontendlb
```
