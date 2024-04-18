RBAC Testing
You can run these commands to check if user permission are perfect


As an administrator you can check if user can perform certain actions in default name space

Kubectl auth can-I create deployment --as dev-user


You can also check if user can perform the same action in a different name space

kubectl auth can-i create deployment -n blue --as dev-user