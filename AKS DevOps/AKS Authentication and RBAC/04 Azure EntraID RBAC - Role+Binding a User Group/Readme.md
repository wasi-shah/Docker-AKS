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
#
/subscriptions/e3b7fac9-cc7a-4e30-898f-087b8f741932/resourcegroups/aksrg/providers/Microsoft.ContainerService/managedClusters/mycluster

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
note: create user using user name and domain/sub domain name aksdev1@your-sub-domain.onmicrosoft.com
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

## 6 - Get Object Id for devaksteam AD Group or user DEV_AKS_GROUP_ID from previous steps
```
# Get Object ID for AD Group devaksteam
az ad group show --group devaksteam --query id -o tsv

# Output
e6dcdae4-e9ff-4261-81e6-0d08537c4cf8
```

## Test Dev User Authentication to Portal
URL: https://portal.azure.com
Username: aksdev1@HS728.onmicrosoft.com
Password: @AKSDemo123


## Now you can create a role in AKS cluster and use the same DEV_AKS_USER_OBJECT_ID as Name
```
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
  name: "e6dcdae4-e9ff-4261-81e6-0d08537c4cf8" 

```

# Create Kubernetes RBAC Role & Role Binding for Dev Namespace
## As AKS Cluster Admin (--admin)
```
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --admin
```

## Create Kubernetes Role and Role Binding
```
kubectl apply -f kube-manifests/role-dev-namespace.yaml
#
role.rbac.authorization.k8s.io/dev-user-full-access-role created

kubectl get role -n dev
#
NAME                        CREATED AT
dev-user-full-access-role   2024-04-18T16:12:45Z
#

kubectl apply -f kube-manifests/rolebinding-dev-namespace.yaml
#
rolebinding.rbac.authorization.k8s.io/dev-user-access-rolebinding created
kubectl get rolebinding -n dev
#
NAME                          ROLE                             AGE
dev-user-access-rolebinding   Role/dev-user-full-access-role   25s

## Verify Role and Role Binding (Again)
kubectl get role -n dev
kubectl get rolebinding -n dev

```
# Validating Dev user access 

## Logout from Admin and  Access Dev Namespace using aksdev1 AD User
## Overwrite kubectl credentials
```
az aks get-credentials --resource-group aksrg --name mycluster --overwrite-existing
#
Merged "mycluster" as current context in /home/hamna/.kube/config

## Now check if you can access any pod (without login as Dev)
kubectl get pods
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