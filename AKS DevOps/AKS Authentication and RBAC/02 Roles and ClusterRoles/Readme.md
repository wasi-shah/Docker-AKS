# Azure RBAC to authorize access to the AKS resource
With the Azure RBAC integration, AKS will use a Kubernetes Authorization webhook server so you can manage Microsoft Entra integrated Kubernetes cluster resource permissions and assignments using Azure role definition and role assignments.

# Roles and ClusterRoles
## Roles
Before assigning permissions to users with Kubernetes RBAC, you'll define user permissions as a Role. Grant permissions within a namespace using roles.
Kubernetes roles grant permissions; they don't deny permissions.
```
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
## RoleBindings
Assign roles to users for a given namespace using RoleBindings. With RoleBindings, you can logically segregate a single AKS cluster, only enabling users to access the application resources in their assigned namespace.

> [!Note]
> To obtain the object ID follow these setps
> #### 1  - Create Azure AD Group
> #### 2 Assign Azure Kubernetes Service Cluster User Role
> #### 3 Create user 
> #### 4 Associate user to the group

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
  name: "4123d819-9ed6-460b-8321-39f02157536b" 

```


## ClusterRoles
To grant permissions across the entire cluster or to cluster resources outside a given namespace, you can instead use ClusterRoles.
A ClusterRole grants and applies permissions to resources across the entire cluster, not a specific namespace.
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
    - apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get", "list", "watch"]

```
## ClusterRoleBinding
With a ClusterRoleBinding, you bind roles to users and apply to resources across the entire cluster, not a specific namespace. This approach lets you grant administrators or support engineers access to all resources in the AKS cluster.
```
 apiVersion: rbac.authorization.k8s.io/v1
# This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io

```