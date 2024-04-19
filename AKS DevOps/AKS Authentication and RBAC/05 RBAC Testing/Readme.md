RBAC Testing
You can run these commands to check if user permission are perfect


As an administrator you can check if user can perform certain actions in default name space
```
Kubectl auth can-I create deployment --as dev-user
```

You can also check if user can perform the same action in a different name space
```
kubectl auth can-i create deployment -n blue --as dev-user
```

Examples
```
Examples
  # Check to see if I can create pods in any namespace
  kubectl auth can-i create pods --all-namespaces
  
  # Check to see if I can list deployments in my current namespace
  kubectl auth can-i list deployments.apps
  
  # Check to see if service account "foo" of namespace "dev" can list pods
  # in the namespace "prod".
  # You must be allowed to use impersonation for the global option "--as".
  kubectl auth can-i list pods --as=system:serviceaccount:dev:foo -n prod
  
  # Check to see if I can do everything in my current namespace ("*" means all)
  kubectl auth can-i '*' '*'
  
  # Check to see if I can get the job named "bar" in namespace "foo"
  kubectl auth can-i list jobs.batch/bar -n foo
  
  # Check to see if I can read pod logs
  kubectl auth can-i get pods --subresource=log
  
  # Check to see if I can access the URL /logs/
  kubectl auth can-i get /logs/
  
  # List all allowed actions in namespace "foo"
  kubectl auth can-i --list --namespace=foo
```