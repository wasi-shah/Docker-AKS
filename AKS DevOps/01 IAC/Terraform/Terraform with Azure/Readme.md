# Provision Azure with Terraform
The Terraform can be used to configure infrastructure in Microsoft Azure using the Azure Resource Manager API's.

## Authenticating to Azure

Terraform supports a number of different methods for authenticating to Azure:

- ### Authenticating to Azure using the Azure CLI
Azure CLI when running Terraform locally.

- ### Authenticating to Azure using Managed Service Identity
Use Managed Service Identity when running Terraform non-interactively (such as when running Terraform in a CI server) 
- ### Authenticating to Azure using a Service Principal and a Client Certificate
Use Service Principal when running Terraform non-interactively (such as when running Terraform in a CI server) 
- ### Authenticating to Azure using a Service Principal and a Client Secret
- ### Authenticating to Azure using OpenID Connect

## Connecting to Terraform 


User Account:
```
az login
```

Service Principal with a Secret:
```
az login --service-principal -u "CLIENT_ID" -p "CLIENT_SECRET" --tenant "TENANT_ID"
```

Service Principal with a Certificate:
```
az login --service-principal -u "CLIENT_ID" -p "CERTIFICATE_PEM" --tenant "TENANT_ID"
```

Service Principal with Open ID Connect (for use in CI / CD):
```
az login --service-principal -u "CLIENT_ID" --tenant "TENANT_ID"
```

Managed Identity:
```
az login --identity
or
az login --identity --username "CLIENT_ID"
```

Once logged in - it's possible to list the Subscriptions associated with the account via:
```
az account list
```