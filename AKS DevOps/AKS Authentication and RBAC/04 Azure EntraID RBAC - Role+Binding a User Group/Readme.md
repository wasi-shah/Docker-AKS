# How to Restrict Access to k8s namespace level resources using Kubernetes RBAC Role and Role Binding with Azure AD


AKS can be configured to use Azure AD for Authentication.
In addition, we can also configure Kubernetes role-based access control (RBAC) to limit access to cluster resources based a user's identity or group membership

> [!Note]
> In this section we will learn how to limit a user to a single namespace using Role and Role binding
![aks RB fundamentals](https://github.com/wasi-shah/Docker-AKS/assets/51749920/4f39c4be-5568-41cd-a7d9-3f593de0a768)

# Deploy App in two Namespaces (As admin)
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

# Check if an admin can access the pod in both dev and qa

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
# Note: create a user using the user name and domain/subdomain name aksdev1@your-sub-domain.onmicrosoft.com
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

## 6 Test if the group can create deployment (before creating role and rolebinding)
```
# Note: reference to default namespace
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


# New config

```
myResourceGroup="aksrg"
echo $myResourceGroup 

myAKSCluster="mycluster"
echo $myAKSCluster

# Create Resource Group
az group create --name $myResourceGroup --location uksouth

# List Resource Group
az group list --output table

# Create cluster
az aks create \
  --resource-group $myResourceGroup \
  --name $myAKSCluster \
  --node-count 1 \
  --node-vm-size "Standard_DS2_v2" \
  --load-balancer-sku basic \
  --enable-aad \
  --aad-admin-group-object-ids ed0188a4-b16a-4202-856e-6063cca49abc
```

## Before you begin - check if AAd is enabled on AKS
> [!note]
> If it's enabled, the output shows the value for enableAzureRbac is false.
```
az aks show -g aksrg -n mycluster -o yaml | grep enableAzureRbac
```

## Create demo groups in Microsoft Entra ID
In this article, we'll create two user roles to show how Kubernetes RBAC and Microsoft Entra ID control access to cluster resources. The following two example roles are used:

- Application developer
  - A user named aksdev that's part of the appdev group.
- Site reliability engineer
  - A user named akssre that's part of the opssre group.

In production environments, you can use existing users and groups within a Microsoft Entra tenant.

1. First, get the resource ID of your AKS cluster using the az aks show command. Then, assign the resource ID to a variable named AKS_ID so it can be referenced in other commands.
```
AKS_ID=$(az aks show \
    --resource-group $myResourceGroup  \
    --name $myAKSCluster \
    --query id -o tsv)

echo $AKS_ID
```

2. Create the first example group in Microsoft Entra ID for the application developers using the az ad group create command. The following example creates a group named appdev:
```
APPDEV_ID=$(az ad group create --display-name appdev --mail-nickname appdev --query id -o tsv)
echo $APPDEV_ID
```

3. Create an Azure role assignment for the appdev group using the az role assignment create command. This assignment lets any member of the group use kubectl to interact with an AKS cluster by granting them the Azure Kubernetes Service Cluster User Role.
```
az role assignment create --assignee $APPDEV_ID --role "Azure Kubernetes Service Cluster User Role" --scope $AKS_ID
```

4. Create a second example group for SREs named opssre.
```
OPSSRE_ID=$(az ad group create --display-name opssre --mail-nickname opssre --query id -o tsv)
echo $OPSSRE_ID
```

5. Create an Azure role assignment to grant members of the group the Azure Kubernetes Service Cluster User Role.
```
az role assignment create --assignee $OPSSRE_ID --role "Azure Kubernetes Service Cluster User Role" --scope $AKS_ID
```

## Create demo users in Microsoft Entra ID
Now that we have two example groups created in Microsoft Entra ID for our application developers and SREs, we'll create two example users. To test the Kubernetes RBAC integration at the end of the article, you'll sign in to the AKS cluster with these accounts.


## Create AKS Dev user account & assign to appdev group

The following command prompts you for the UPN and sets it to AAD_DEV_UPN so it can be used in a later command:
```
echo "Please enter the UPN for application developers: " && read AAD_DEV_UPN
echo $AAD_DEV_UPN
```
The following command prompts you for the password and sets it to AAD_DEV_PW for use in a later command:
```
echo "Please enter the secure password for application developers: " && read AAD_DEV_PW
echo $AAD_DEV_PW
```

Create a user with the display name AKS Dev and the UPN and secure password using the values in AAD_DEV_UPN and AAD_DEV_PW:
```
AKSDEV_ID=$(az ad user create --display-name "AKS Dev" --user-principal-name $AAD_DEV_UPN --password $AAD_DEV_PW --query id -o tsv)
```

Add the user to the appdev group created in the previous section using the az ad group member add command.
```
az ad group member add --group appdev --member-id $AKSDEV_ID
```

## Create AKS SRE user account & assign to opssre group
Set the UPN and password for SREs. The UPN must include the verified domain name of your tenant, for example akssre@contoso.com. The following command prompts you for the UPN and sets it to AAD_SRE_UPN for use in a later command:
```
echo "Please enter the UPN for SREs: " && read AAD_SRE_UPN
echo $AAD_SRE_UPN
```

The following command prompts you for the password and sets it to AAD_SRE_PW for use in a later command:
```
echo "Please enter the secure password for SREs: " && read AAD_SRE_PW
echo $AAD_SRE_PW
```

Create a second user account. The following example creates a user with the display name AKS SRE and the UPN and secure password using the values in AAD_SRE_UPN and AAD_SRE_PW:
```
# Create a user for the SRE role
AKSSRE_ID=$(az ad user create --display-name "AKS SRE" --user-principal-name $AAD_SRE_UPN --password $AAD_SRE_PW --query id -o tsv)

# Add the user to the opssre Azure AD group
az ad group member add --group opssre --member-id $AKSSRE_ID
```

## Create AKS cluster resources for app devs

We have our Microsoft Entra groups, users, and Azure role assignments created. Now, we'll configure the AKS cluster to allow these different groups access to specific resources.

1. Get the cluster admin credentials using the az aks get-credentials command. In one of the following sections, you get the regular user cluster credentials to see the Microsoft Entra authentication flow in action.
```
az aks get-credentials --resource-group $myResourceGroup  --name $myAKSCluster --admin
```
2. Create a namespace in the AKS cluster using the kubectl create namespace command. The following example creates a namespace name dev:
```
kubectl create namespace dev
# check if you can access the dev namespace as dev group 

# Get $APPDEV_ID if you not already have it - az ad group show --group appdev --query id -o tsv
kubectl auth can-i list deploy -n dev --as $APPDEV_ID


```
3. Create a Role for the dev namespace, which grants full permissions to the namespace. In production environments, you can specify more granular permissions for different users or groups. Create a file named role-dev-namespace.yaml and paste the following YAML manifest:


```
# role-dev-namespace.yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-full-access
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
  ---
  ```
  4. Create the Role using the kubectl apply command and specify the filename of your YAML manifest.
  ```
  kubectl apply -f role-dev-namespace.yaml
  ```

  5. Get the resource ID for the appdev group using the az ad group show command. This group is set as the subject of a RoleBinding in the next step.
  ```
  az ad group show --group appdev --query id -o tsv
  ```

  6. Create a RoleBinding for the appdev group to use the previously created Role for namespace access. Create a file named rolebinding-dev-namespace.yaml and paste the following YAML manifest. On the last line, replace groupObjectId with the group object ID output from the previous command.
```
# rolebinding-dev-namespace.yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: dev-user-access
  namespace: dev
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: dev-user-full-access
subjects:
- kind: Group
  namespace: dev
  name: groupObjectId
```
  > [!Note]
  >  Tip 
  > If you want to create the RoleBinding for a single user, specify kind: User and replace groupObjectId with the user principal name (UPN) in the above sample.

  7. Create the RoleBinding using the kubectl apply command and specify the filename of your YAML manifest:
```
kubectl apply -f rolebinding-dev-namespace.yaml
```

## Create the AKS cluster resources for SREs
Now, we'll repeat the previous steps to create a namespace, Role, and RoleBinding for the SREs.

1. Create a namespace for sre using the kubectl create namespace command.
```
kubectl create namespace sre
```

2. Create a file named role-sre-namespace.yaml and paste the following YAML manifest:
```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: sre-user-full-access
  namespace: sre
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

3. Create the Role using the kubectl apply command and specify the filename of your YAML manifest.
```
kubectl apply -f role-sre-namespace.yaml
```
4. Get the resource ID for the opssre group using the az ad group show command.
```
az ad group show --group opssre --query id -o tsv
```

5. Create a RoleBinding for the opssre group to use the previously created Role for namespace access. Create a file named rolebinding-sre-namespace.yaml and paste the following YAML manifest. On the last line, replace groupObjectId with the group object ID output from the previous command.
```
# rolebinding-sre-namespace.yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: sre-user-access
  namespace: sre
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: sre-user-full-access
subjects:
- kind: Group
  namespace: sre
  name: groupObjectId
```
6. Create the RoleBinding using the kubectl apply command and specify the filename of your YAML manifest.
```
kubectl apply -f rolebinding-sre-namespace.yaml
```

## Interact with cluster resources using Microsoft Entra identities
Now, we'll test that the expected permissions work when you create and manage resources in an AKS cluster. In these examples, we'll schedule and view pods in the user's assigned namespace, and try to schedule and view pods outside of the assigned namespace.

###  Test the Dev access to the AKS cluster resources
1. Login in a private mode and login through user dev@HS728.onmicrosoft.com
>[!Note>]
Assign storage contributor role to appdev and opssre group so they can access the storage account and resource group
```
az aks get-credentials --resource-group $myResourceGroup --name $myAKSCluster --overwrite-existing
or
az aks get-credentials --resource-group aksrg --name mycluster

kubectl auth can-i list deploy -n dev
# To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code DHLH7BFJ3 to authenticate.
yes
kubectl auth can-i list deploy -n sre
no

# check if you can deply app in dev 
kubectl run nginx-dev --image=mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine --namespace dev
kubectl get pods --namespace dev

# Try to view pods outside of the dev namespace. Use the kubectl get pods command again, this time to see --all-namespaces.
kubectl get pods --all-namespaces
Error from server (Forbidden): pods is forbidden: User "aksdev@contoso.com" cannot list resource "pods" in API group "" at the cluster scope

# In the same way, try to schedule a pod in a different namespace, such as the sre namespace. The user's group membership doesn't align with a Kubernetes Role and RoleBinding to grant these permissions, as shown in the following example output:

$ kubectl run nginx-dev --image=mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine --namespace sre

Error from server (Forbidden): pods is forbidden: User "aksdev@contoso.com" cannot create resource "pods" in API group "" in the namespace "sre"
```

### Test the SRE access to the AKS cluster resources
To confirm that our Microsoft Entra group membership and Kubernetes RBAC work correctly between different users and groups, try the previous commands when signed in as the opssre user.

1. Login in a private mode and login through user ops@HS728.onmicrosoft.com
>[!Note>]
Assign storage contributor role to appdev and opssre group so they can access the storage account and resource group
```
az aks get-credentials --resource-group $myResourceGroup --name $myAKSCluster --overwrite-existing
or
az aks get-credentials --resource-group aksrg --name mycluster


kubectl auth can-i list deploy -n sre
# To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code DHLH7BFJ3 to authenticate.
yes
kubectl auth can-i list deploy -n dev
no

# check if you can deply app in dev 
kubectl run nginx-dev --image=mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine --namespace dev
kubectl get pods --namespace dev

