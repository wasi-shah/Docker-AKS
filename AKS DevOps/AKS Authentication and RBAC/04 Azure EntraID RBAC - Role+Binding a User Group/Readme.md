# How to Restrict Access to k8s namespace level resources using Kubernetes RBAC Role and Role Binding with Azure AD


AKS can be configured to use Azure AD for Authentication.
In addition, we can also configure Kubernetes role-based access control (RBAC) to limit access to cluster resources based a user's identity or group membership

> [!Note]
> In this section we will learn how to limit a user to a single namespace using Role and Role binding
![aks RB fundamentals](https://github.com/wasi-shah/Docker-AKS/assets/51749920/4f39c4be-5568-41cd-a7d9-3f593de0a768)

# Deploy App in twp Namespaces (As admin)
```
# Create Namespaces dev and qa
kubectl create namespace dev
kubectl create namespace qa

# 
namespace/dev created
namespace/qa created

# Run app in both ns
kubectl run nginx --image=nginx -n dev
kubectl run nginx --image=nginx -n qa

# Check if asn admin can access the pod in both dev and qa

kubectl get pod -n dev
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          80s

kubectl get pod -n qa
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          80s

```
> [!important]
> New create a user who can only access dev namespace.

# Create user/group and assign RBAC
## 1  - Create Azure AD Group
```
# Get Azure AKS Cluster Id
AKS_CLUSTER_ID=$(az aks show --resource-group aksrg --name mycluster --query id -o tsv)
echo $AKS_CLUSTER_ID


# Create Azure AD Group
# Note: Id filed represents object id
DEV_AKS_GROUP_ID=$(az ad group create --display-name devaksteam --mail-nickname devaksteam --query id -o tsv)
echo $DEV_AKS_GROUP_ID
```
## 2 Assign Azure Kubernetes Service Cluster User Role to Group
```
# Create Role Assignment 
az role assignment create \
  --assignee $DEV_AKS_GROUP_ID \
  --role "Azure Kubernetes Service Cluster User Role" \
  --scope $AKS_CLUSTER_ID
```

## 3 Create user 
```
# Create Dev User
# Note: Id filed represents object id
# Note: create user using user name and domain/sub domain name aksdev1@your-sub-domain.onmicrosoft.com
DEV_AKS_USER_OBJECT_ID=$(az ad user create \
  --display-name "AKS Dev1" \
  --user-principal-name aksdev1@HS728.onmicrosoft.com \
  --password @AKSDemo123 \
  --query id -o tsv)
echo $DEV_AKS_USER_OBJECT_ID 
```
## 4 Associate user to the group
```
# Associate Dev User to Dev AKS Group
az ad group member add --group devaksteam --member-id $DEV_AKS_USER_OBJECT_ID
```
## 5 Double-Check user Azure role assignments
# In GUI
>Portal > Entra ID, Select user, Azure role assignments

## 6 Test if group can create deployment (before creating role and rolebinding)
```
# Note: reference to default name space
kubectl auth can-i create deployment --as $DEV_AKS_GROUP_ID
# no

kubectl auth can-i create deployment -n dev --as $DEV_AKS_GROUP_ID
# no

kubectl auth can-i create deployment -n qa --as $DEV_AKS_GROUP_ID
# no

kubectl auth can-i get pod -n dev --as $DEV_AKS_GROUP_ID
# 
```


## Now you can create a role in AKS cluster and use the same DEV_AKS_USER_OBJECT_ID as Name
```
# role-dev-namespace.yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-full-access-role
  namespace: dev
rules:
- apiGroups: ["", "extensions", "apps"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["batch"]
  resources:
  - jobs
  - cronjobs
  verbs: ["*"]

```
## Now you can create a binding in AKS cluster

```
# rolebinding-dev-namespace.yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-access-rolebinding
  namespace: dev
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: dev-user-full-access-role
subjects:
- kind: Group
  namespace: dev
  #name: groupObjectId # Your Azure AD Group Object ID: devaksteam
  name: "e6dcdae4-e9ff-4261-81e6-0d08537c4cf8"  # Your group Id here

```


# Create Kubernetes RBAC Role & Role Binding for Dev Namespace


## Create Kubernetes Role and Role Binding
```
kubectl apply -f kube-manifests/role-dev-namespace.yaml
kubectl apply -f kube-manifests/rolebinding-dev-namespace.yaml

## Verify Role and Role Binding (Again)
kubectl get role -n dev
kubectl get rolebinding -n dev

```
# Validating Dev user access 

Logout from Admin and  Access Dev Namespace using aksdev1 AD User
## Overwrite kubectl credentials
```
az aks get-credentials --resource-group aksrg --name mycluster --overwrite-existing
#
Merged "mycluster" as current context in /home/hamna/.kube/config

# Now check if you can access any pod (without login as Dev)
kubectl get pods


# Check directly while logged in as admin
Kubectl auth can-I create deployment
kubectl auth can-i create deployment -n dev
kubectl auth can-i create deployment -n qa
Kubectl auth can-I create deployment --as e6dcdae4-e9ff-4261-81e6-0d08537c4cf8
```

# Clean-Up

Login as admin in AKS and cleanup following AKS resources

Delete namespaces 
```
kubectl delete ns dev
kubectl delete ns qa
```

Delete Role and RoleBinding
```
kubectl delete -f kube-manifests/rolebinding-dev-namespace.yaml
kubectl delete -f kube-manifests/rolebinding-dev-namespace.yaml
```

Delete Entra Id Group and users
```
# Delete Group
DEV_AKS_GROUP_ID=$(az ad group show --group devaksteam --query id -o tsv)
echo $DEV_AKS_GROUP_ID
az ad group delete -g $DEV_AKS_GROUP_ID

# Delete User

DEV_AKS_USER_OBJECT_ID=$(az ad user show --id aksdev1@HS728.onmicrosoft.com --query id -o tsv)
echo $DEV_AKS_USER_OBJECT_ID
az ad user delete --id $DEV_AKS_USER_OBJECT_ID

```