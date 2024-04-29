# Infrastructure as Code (IaC) tools
Infrastructure as Code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

# Terraform
HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## Terraform workflow
The core Terraform workflow consists of three stages:

### Init
The terraform init command initializes a working directory containing Terraform configuration files. 

### Write:
You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.

### Plan: creates an execution plan
Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.

### Apply: Builds or change infrastructure 
On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

## Terraform basic / essential commands
### Main commands
| Commands  | Action |
| ------------- | ------------- |
|  init |  Prepare your working directory for other commands. Run terraform init to initialize the Terraform deployment. This command downloads the Azure provider required to manage your Azure resources. |
|  validate | Check whether the configuration is valid  |
|  plan |  Show changes required by the current configuration |
|  apply | Create or update infrastructure  |
|  destroy | Destroy previously-created infrastructure  |

All other commands:
| Commands  | Action |
| ------------- | ------------- |
|   console     |   Try Terraform expressions at an interactive command prompt
|   fmt         |   Reformat your configuration in the standard style
|   force-unlock |  Release a stuck lock on the current workspace
|   get           | Install or upgrade remote Terraform modules
|   graph         | Generate a Graphviz graph of the steps in an operation
|   import        | Associate existing infrastructure with a Terraform resource
|   login         | Obtain and save credentials for a remote host
|   logout        | Remove locally-stored credentials for a remote host
|   metadata      | Metadata related commands
|   output        | Show output values from your root module
|   providers     | Show the providers required for this configuration
|   refresh       | Update the state to match remote systems
|   show          | Show the current state or a saved plan
|   state         | Advanced state management
|   taint         | Mark a resource instance as not fully functional
|   untaint       | Remove the 'tainted' state from a resource instance
|   version       | Show the current Terraform version
|   workspace     | Workspace management

## Terraform Files
### IaC Project files
To begin writing a Terraform configuration while adhering to the best practices, we create the files below in the project’s root directory.

The files are not required to have the exact same names listed above. However, these are general conventions used in Terraform projects.

| ext | Purpose |
| ------------- | ------------- |
|  provider.tf | Add Azure as provider in this file for example required_providers{} and provider{}  |
|  main.th | containing the resource blocks which define the resources to be created in the target cloud platform.  |
|  output.tf | containing the output that needs to be generated on successful completion of “apply” operation.  |
|  variables.tf | [Variable Declaration] - containing the variable declarations used in the resource blocks and these might or might not have a default value. |
|  *.tfvars | [Variables Assignment] - containing the environment-specific default values of variables.  |


### Terraform Managed Files
| ext | Created/edited stage | Purpose | 
| ------------- | ------------- |------------- |
|  .terraform.lock.hcl | init |maintains the hashes of the downloaded binaries for consistency  |
|  terraform.tfstate | apply or destroy  |This is the Terraform state file, which is critical and automatically managed by Terraform.  |
|  .terraform.tfstate.lock.info | plan, apply, destroy  | Temporary file which is automatically deleted once the operation is completed, the file is removed.  |
|  .terraform.tfstate.backup | refresh  | Keeps last local state as backup  |
|  .plan | terraform plan -out filename.plan  | Produce plan file to be used for <li>terraform apply "main.tfplan" <li>terraform plan -destroy -out main.tfplan |

## Terraform commonly used blocks
- terraform block
Terraform block is used for setting the version of the terraform we want. It may also contain required_providers block inside which specifies the versions of the providers we need as well as where Terraform should download these providers from.
```HCL
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
```
- provider block
- resource block
- variable block
- locals block
- data block
- module block
- output block
- provisioner block




## Terraform variables 

### Assigning Values
When variables are declared in variables.tf, they can be set in a number of ways:

- In an HCP Terraform workspace.
- Individually, with the -var command line option.
- In variable definitions (.tfvars) files, either specified on the command line or automatically loaded.
- As environment variables.
- Variable defaults during variable declaration.

### Priority and file names
| Priority | ext | Purpose |
| ---------| ------------- | ------------- |
|  1 | command line <li>-var <li>-var-file  |  values set by command for example <li> [terraform plan -var "location=uksouth"] <li> [terraform plan -var-file="prod.tfvars"] |
|  2 | *.auto.tfvars  | Terraform loads the values from the *.auto.tfvars file by automatically.
|  3 | terraform.tfvars  | Terraform loads the values from the terraform.tfvars file by default. 
|  4 | Environment set variables  | values set by TF_VAR_location for example <li>Linux > [TF_VAR_resource_group_location="uksouth" terraform plan] <li>Windows > <li>  set TF_VAR_location=ukwest<li>  [terraform plan]
| 5 | in variables.tf | variable "location" { type        = string default     = "uksouth"  description = Location of the resource group." } |

### Terraform variable types, declaration and assignment
#### Terraform data types
The Terraform language uses the following types for its values:
- string: a sequence of Unicode characters representing some text, like "hello".
```
# Declare
variable username {
  type = string
  default = "world"

}

# Access
${var.username}
```
- number: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.
```
# Declare

variable age {
  type = number
  default = 23
}

# Access
${var.age}

```
- bool: a boolean value, either true or false. bool values can be used in conditional logic.
```
# Declaration
variable "set_password" {
  default = false
}

# Access
var.set_password

```
- list ( Array or tuple): a sequence of values, like ["us-west-1a", "us-west-1c"]. Identify elements in a list with - consecutive whole numbers, starting with zero.
```
# Declare

variable users {
    type = list
    default = ["root", "user1", "user2"]
}

# Access
${(var.users[1])}

```
- set: a collection of unique values that do not have any secondary identifiers or ordering.
- map (or object): a group of values identified by named labels, like {name = "Mabel", age = 52}.
```
# Declare

variable "plans" {
  type = map
  default = {
    "5USD"  = "1xCPU-1GB"
    "10USD" = "1xCPU-2GB"
  }
}

# Assign 
# Add command line
terraform plan -var -var plans="{"5USD"=ABC,"10USD"=XYZ}" 


# Access
var.plans["5USD"]

or
{lookup(var.plans, "5USD")}

or - based on another variable
${lookup(var.plans, "${var.variable-name-here}")}


```


#### Variable Declaration
> [!note] 
> You can also assign default value during declaration
variables.tf
```
variable "location" {
  type        = string
  default     = "uksouth"
  description = "Location of the resource group."
}
```

#### Ways to assign a Variable value

##### Variable Value Assignment through the Command Line
To specify individual variables on the command line, use the -var option when running the terraform plan and terraform apply commands:
```
terraform plan -var "location=ukwest"
```

##### Variable Value Assignment through .tfvar file 
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:

testing.tfvars
```
location="ukwest"
```

```
# Linux, Mac OS, and UNIX:
terraform apply -var-file="testing.tfvars"

# PowerShell:
terraform apply -var-file='testing.tfvars'

# Windows cmd.exe:
terraform apply -var-file="testing.tfvars"
```

#####  Variable Value Assignment through Environment variables
As a fallback for the other ways of defining variables, Terraform searches the environment of its own process for environment variables named TF_VAR_ followed by the name of a declared variable.
```
# Linux
$ export TF_VAR_location=ukwest
$ terraform plan

# Windows 
set TF_VAR_location=ukwest
terraform plan
```

#### Reading Variable Value 
If we want to use a variable in terraform then we can use it using var.variableName and ${var.variableName} inside string
```
variable username {}

output printname {
    value = "Hello, ${var.username}"
}

```

### Defining output variables
Output variables provide a convenient way to get useful information about your infrastructure. As you might have noticed, much of the server details are calculated at deployment and only become available afterwards. Using output variables you can extract any server-specific values including the calculated details.

Configuring output variables is really quite simple. All you need to do is define a name for the output and what value it should correspond to. These can be included in your Terraform plan or in their own file.

Start by creating an output variables file called output.tf and open it for edit.

```
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
```
## Terraform Functions
The Terraform language includes a number of built-in functions that you can call from within expressions to transform and combine values. The general syntax for function calls is a function name followed by comma-separated arguments in parentheses

- Numeric Functions : abs, ceil, floor, log, max, min, parseint, pow, signum
- String Functions: chomp, format, formalist, join, lower, regex, regexall, rep[lace, split, strrev, title, trim, trimprefix, trimsuffix, trimspace, upper
- Collection Functions: alltrue, anytrue, chunklist, coalesce, coalescelist, compact, concat, contains, distinct, element, flatten, index, keys, length, list, lookup, map, matchkeys,merge, one, range, reverse, setintersection, setproduct, setsubsctract, setunion, slice, sort, sum, transpose, values, zipmap
- Encoding Functions: base643ncode, base64decode, base64gzip, csvdecode, jsonencode, jsondecode, urlencode, yamlencode, yamldecode
- Filesystem functions: absath, dirname, pathexpand, basename, file, fileexists, fileset, filebase64, templatefile
- Date & Time Functions: formade, timeadd, timestamp
- Hash and Crypto Functions : base64sha256, base64sha512, bcrypt, filebase64sha512, filemd5, filesha1, filesha256, filesha512, md5, rsadecrypt, sha, sha256, sha512, uuid, uuidv5
- IP Network Functions: cidrhost, cidrnetmask, cidrsubnets
- Type Conversion functions: can, defaults, nonsensative, sensitive, tobool, tolist, tomap, tonumber, toset, tostring, try

```
max(5, 12, 9)

join(", ", ["foo", "bar", "baz"])
# foo, bar, baz

```


## Terraform resource graph
Terraform builds a resource graph to determine resource dependencies and creates or modifies non-dependent resources in parallel.
> [!note]
> You do not need to write step-by-step instructions to create resources because Terraform handles the underlying dependencies logic.


## Terraform state file
Terraform generates a plan and prompts you for your approval before modifying your infrastructure. It also keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.
> [!note]
> Terraform keeps track of your real infrastructure in a state file

## Terraform local state vs real state
terraform refresh: Updates local state file against real resources in cloud
Desired State: Local Terraform Manifest (main.tf)
Current State: Real Resources present in your cloud
Command Order of Execution: refresh, plan, make a decision, apply


## Terraform Registry
browsable and searchable interface for finding providers, and makes it possible for Terraform CLI to automatically install any of the providers it hosts

The Terraform Registry is integrated directly into Terraform so you can directly specify providers and modules.
> [!note]
> The Terraform Registry is the main source for publicly available Terraform providers. It offers a 

## Providers
Providers are how Terraform integrates with any upstream API.
For example Azure, AWS and GCP
> [!note]
> - Providers allow Terraform to interact with cloud providers, SaaS providers, and other APIs. 
> - Each provider adds a set of resource types and/or data sources that Terraform can manage.
> - Every resource type is implemented by a provider; without providers, Terraform can't manage any kind of infrastructure.


## Modules
Modules are self-contained packages of Terraform configurations that are managed as a group.
> [!Note]
> For example, [aks] module is a Terraform Module for deploying an AKS cluster


# Terraform Use Cases
## Parallel Environments
You may have staging or QA environments that you use to test new applications before releasing them in production. As the production environment grows larger and more complex, it can be increasingly difficult to maintain an up-to-date environment for each stage of the development process. Terraform lets you rapidly spin up and decommission infrastructure for development, test, QA, and production. Using Terraform to create disposable environments as needed is more cost-efficient than maintaining each one indefinitely.


## Software Demos
You can use Terraform to create, provision, and bootstrap a demo on various cloud providers. This lets end users easily try the software on their own infrastructure and even enables them to adjust parameters like cluster size to more rigorously test tools at any scale.

## Kubernetes
Kubernetes is an open-source workload scheduler for containerized applications. Terraform lets you both deploy a Kubernetes cluster and manage its resources (e.g., pods, deployments, services, etc.). You can also use the Kubernetes Operator for Terraform to manage cloud and on-prem infrastructure through a Kubernetes Custom Resource Definition (CRD) and HCP Terraform.


# Terraform providers for Azure infrastructure
There are several Terraform providers that enable the management of Azure infrastructure:

- AzureRM: Manage stable Azure resources and functionality such as virtual machines, storage accounts, and networking interfaces.
- AzureAD: Manage Microsoft Entra resources such as groups, users, service principals, and applications.
- AzureDevops: Manage Azure DevOps resources such as agents, repositories, projects, pipelines, and queries.
- AzAPI: Manage Azure resources and functionality using the Azure Resource Manager APIs directly. This provider compliments the AzureRM provider by enabling the management of Azure resources that aren't released. For more information about the AzAPI provider, see Terraform AzAPI provider.
- AzureStack: Manage Azure Stack Hub resources such as virtual machines, DNS, virtual networks, and storage.


# Benefits of Terraform with Azure
This section describes the benefits of using Terraform to manage Azure infrastructure.

## Common IaC tool
Terraform Azure providers enable you to manage all of your Azure infrastructure using the same declarative syntax and tooling. Using these providers you can:

- Configure core platform capabilities such as management groups, policies, users, groups, and policies. For more information, see Terraform implementation of Cloud Adoption Framework Enterprise-scale.
- Configure Azure DevOps projects and pipelines to automate regular infrastructure and application deployments.
- Deploy Azure resources required by your applications.

## Automate infrastructure management
The Terraform template-based configuration file syntax enables you to configure Azure resources in a repeatable and predictable manner. Automating infrastructure includes the following benefits:

- Lowers the potential for human errors while deploying and managing infrastructure.
- Deploys the same template multiple times to create identical development, test, and production environments.
- Reduces the cost of development and test environments by creating them on-demand.

## Understand infrastructure changes before being applied
As a resource topology becomes complex, understanding the meaning and impact of infrastructure changes can be difficult.

The Terraform CLI enables users to validate and preview infrastructure changes before application of the plan. Previewing infrastructure changes in a safe manner has several benefits:

- Team members can collaborate more effectively by understanding proposed changes and their impact.
- Unintended changes can be caught early in the development process.

# Writing Terraform code
You can write terraform code using HCL or any other language using CDK for Terraform
Cloud Development Kit for Terraform (CDKTF).


> [!note]
> Cloud Development Kit for Terraform (CDKTF) allows you to use familiar programming languages to define and provision infrastructure. This gives you access to the entire Terraform ecosystem without learning HashiCorp Configuration Language (HCL) and lets you leverage the power of your existing toolchain for testing, dependency management, etc.

> Terraform support 
> - TypeScript, Python, Java, C#, and Go.
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/fbfff318-0e80-45ae-b30d-a1985e548bc9)


# Terraform Files
Files containing Terraform code are often called configuration files.
Code in the Terraform language is stored in plain text files with the .tf file extension. There is also a JSON-based variant of the language that is named with the .tf.json file extension.

https://developer.hashicorp.com/terraform/language/files



# Provision Azure with Terraform
The Terraform can be used to configure infrastructure in Microsoft Azure using the Azure Resource Manager API's.

## Authenticating to Azure

Terraform supports a number of different methods for authenticating to Azure:

- ### Authenticating to Azure using the Azure CLI
Azure CLI when running Terraform locally.
```
az login
```
- ### Authenticating to Azure using Managed Service Identity
Use Managed Service Identity when running Terraform non-interactively (such as when running Terraform in a CI server) 
```
az login --identity
or
az login --identity --username "CLIENT_ID"
```
- ### Authenticating to Azure using a Service Principal and a Client Certificate
Use Service Principal when running Terraform non-interactively (such as when running Terraform in a CI server) 
```
az login --service-principal -u "CLIENT_ID" -p "CERTIFICATE_PEM" --tenant "TENANT_ID"
```
- ### Authenticating to Azure using a Service Principal and a Client Secret
```
az login --service-principal -u "CLIENT_ID" -p "CLIENT_SECRET" --tenant "TENANT_ID"
```
- ### Authenticating to Azure using OpenID Connect
```
# Service Principal with Open ID Connect (for use in CI / CD):
az login --service-principal -u "CLIENT_ID" --tenant "TENANT_ID"
```
- ### Authenticating to Azure using AKS Workload Identity
AKS Workload Identity can be used to authenticate to services that support Azure Active Directory (Azure AD) authentication when running in Azure Kubernetes Service clusters.

When a service account and pod are configured to use AKS Workload Identity, a federated identity token is injected into the pod at run-time, along with environment variables to use that identity.


> [!Important]
> Use a service principal or a managed identity when running Terraform non-interactively (such as when running Terraform in a CI/CD pipeline)


# Install Terraform on Windows

1. Install the Azure CLI
Install Azure cli - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows
2. Install Terraform for Windows
   - Install Terraform on local PC - https://www.terraform.io/downloads.html
   - From the download, extract the executable to a directory of your choosing (for example, c:\terraform).
   - Update your system's global PATH environment variable to include the directory that contains the executable.
   - Open a terminal window.
   - Verify the global path configuration with the terraform command. 
   ```
   terraform -version
   ```

# Authenticate Terraform to Azure
> [!Note]
> Terraform only supports authenticating to Azure via the Azure CLI. Authenticating using Azure PowerShell isn't supported. 

## Authenticate via a Microsoft account
A Microsoft account is a username (associated with an email and its credentials) that is used to sign in to Microsoft services - such as Azure. A Microsoft account can be associated with one or more Azure subscriptions, with one of those subscriptions being the default.

The following steps show you how:

- Sign in to Azure interactively using a Microsoft account
- List the account's associated Azure subscriptions (including the default)
- Set the current subscription.

```
# Open a command line that has access to the Azure CLI.

# Run az login without any parameters and follow the instructions to sign in to Azure.

az login

# To confirm the current Azure subscription, run az account show.
az account show

# To view all the Azure subscription names and IDs for a specific Microsoft account, run az account list.
az account list --query "[?user.name=='<microsoft_account_email>'].{Name:name, ID:id, Default:isDefault}" --output Table

# Note: Replace the <microsoft_account_email> placeholder with the Microsoft account email address whose Azure subscriptions you want to list.

# To use a specific Azure subscription, run az account set.
az account set --subscription "<subscription_id_or_subscription_name>"
az logout
```

## Authenticate via a service principal
Automated tools that deploy or use Azure services - such as Terraform - should always have restricted permissions. Instead of having applications sign in as a fully privileged user, Azure offers service principals.

The most common pattern is to interactively sign in to Azure, create a service principal, test the service principal, and then use that service principal for future authentication (either interactively or from your scripts).


```
# Login as user with full rights to create service principle.
az login

# To create a service principal, run az ad sp create-for-rbac.
az ad sp create-for-rbac --name <service_principal_name> --role Contributor --scopes /subscriptions/<subscription_id>

# Key points:

# - You can replace the <service-principal-name> with a custom name for your environment or omit the parameter entirely. If you omit the parameter, the service principal name is generated based on the current date and time.
# - Upon successful completion, az ad sp create-for-rbac displays several values. The appId, password, and tenant values are used in the next step.
# - The password can't be retrieved if lost. As such, you should store your password in a safe place. If you forget your password, you can reset the service principal credentials.
# - For this article, a service principal with a Contributor role is being used. For more information about Role-Based Access Control (RBAC) roles, see RBAC: Built-in roles.
# - The output from creating the service principal includes sensitive credentials. Be sure that you don't include these credentials in your code or check the credentials into your source control.

# This command will output 5 values:
{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "0000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}
```

These values map to the Terraform variables like so:

- appId is the client_id defined above.
- password is the client_secret defined above.
- tenant is the tenant_id defined above.

### Finally, it's possible to test these values work as expected by first logging in:
```
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID

# Once logged in as the Service Principal - we should be able to list the VM sizes by specifying an Azure region, for example here we use the West US region:

az vm list-sizes --location westus
```

### Specify service principal credentials in environment variables
Once you create a service principal, you can specify its credentials to Terraform via environment variables.
```
# Edit the ~/.bashrc file by adding the following environment variables.
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"

# To execute the ~/.bashrc script, run source ~/.bashrc (or its abbreviated equivalent . ~/.bashrc). You can also exit and reopen Cloud Shell for the script to run automatically.
. ~/.bashrc

# Once the environment variables have been set, you can verify their values as follows:
printenv | grep ^ARM*
# or on Windows
Set
```
### Specify service principal credentials in a Terraform provider block
The Azure provider block defines syntax that allows you to specify your Azure subscription's authentication information.
```
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  # It's also possible to configure Terraform to use a specific Subscription
  subscription_id   = "<azure_subscription_id>"

  # If you're looking to use Terraform across Tenants - it's possible to do this by configuring the Tenant ID field in the Provider block
  tenant_id         = "<azure_subscription_tenant_id>"

  client_id         = "<service_principal_appid>"
  client_secret     = "<service_principal_password>"
}

# Your code goes here
```
> [!Important]
> At this point running either terraform plan or terraform apply should allow Terraform to run using the Service Principal to authenticate.

### Using variable to pass client_secret
It's also possible to configure these variables either in-line or from using variables in Terraform (as the client_secret is in this example), like so:
```
variable "client_secret" {
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "00000000-0000-0000-0000-000000000000"
  client_secret   = var.client_secret
  tenant_id       = "10000000-0000-0000-0000-000000000000"
  subscription_id = "20000000-0000-0000-0000-000000000000"
}
```
> [!Important]
> At this point running either terraform plan or terraform apply should allow Terraform to run using the Service Principal to authenticate.
# Store Terraform state in Azure Storage
Terraform state is used to reconcile deployed resources with Terraform configurations. State allows Terraform to know what Azure resources to add, update, or delete. State storage is key for all terraform resources and it should be deleted at any point of time even accidentally.


# Demos
<details>
<summary>Create resource group without variable</summary>

### Add [azurerm] as provider, create resource group
Source:

```HCL
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "uksouth"
}

# Output
output "MyResourceGroupValues" {
  value = "Name: ${azurerm_resource_group.example.name} wiht ID: ${azurerm_resource_group.example.id}"
}
```

Execution:

```HCL
cd 01-demo-resource-group-simple
terraform init
terraform plan
terraform apply
terraform destroy

```
</details>

<details>
<summary>Link Azure storage account with Terraform </summary>

> [!Note] 
> By default, Terraform state is stored locally, which isn't ideal for the following reasons:
> Local state doesn't work well in a team or collaborative environment.
> Terraform state can include sensitive information.
> Storing state locally increases the chance of inadvertent deletion.

Create a new storage account 
- Create Azure Storage Account in new Resource Group
- Create New Resource Group: terraform-storage-rg
- Create Storage Account: storageaccountname (Note: Name should be unique across Azure)
- Create Container Name: containername (for example tfstatefiles )
- Upload the file terraform.tfstate to storage account container

> [!Note] 
> You can also link an existing storage account - just upload the file terraform.tfstate to storage account container.


Source:

```HCL
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "<storage_account_name>"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "uksouth"
}

```

Execution:

```HCL
cd 01-demo-resource-group-simple
terraform init
terraform plan
# This will lock the state file temporarily inside Azure
# LEASE STATUS	Locked
# LEASE STATE	Leased

```
</details>


<details>
<summary>Create an Azure resource group using variables</summary>

### Create resource group with random name

https://learn.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli

```HCL
cd 02-demo-resource-group
terraform init
terraform plan -out main.tfplan
terraform apply main.tfplan


# Clean up resources
# When you no longer need the resources created via Terraform, do the following steps:
# 1 - Run terraform plan and specify the destroy flag.
terraform plan -destroy -out main.destroy.tfplan
# 2 - terraform apply main.destroy.tfplan
terraform apply main.destroy.tfplan

```
</details>

<details>
<summary>Add tags to existing resource group</summary>
In the above example, we have created a resource group. 
The state of the group is already saved into a state file.
Now add [tags] block in main.tf file and execute plan 

```
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
  # Add Tags
  tags = {
    "environment" = "k8sdev"
    "demotag"     = "refreshtest"
  }
}
```


Following block is added / uncomment in the code
```
  tags = {
    "environment" = "k8sdev"
    "demotag"     = "refreshtest"
  }
```

```HCL
cd 02-demo-resource-group-edit
terraform init
terraform plan -out main.tfplan
terraform apply main.tfplan
# Verify the results
resource_group_name=$(terraform output -raw resource_group_name)
az group show --name $resource_group_name

# Clean up resources
# When you no longer need the resources created via Terraform, do the following steps:
# 1 - Run terraform plan and specify the destroy flag.
terraform plan -destroy -out main.destroy.tfplan
# 2 - terraform apply main.destroy.tfplan
terraform apply main.destroy.tfplan

```
</details>

<details>
<summary>Sync Current State and Desired</summary>

- Desired State: Local Terraform Manifest (main.tf)
- Current State: Real Resources present in your cloud

Sometimes you made changed directly to your portal, these changed are not available in your main.tf file
Following example shows how to compare the current state with desire state and update either desire state with current or current state with desire

#### Add new tag in resource group using portal.
1. Login to portal
2. Find Resource group
3. click Tags
4. Enter new tag for example portal-tag: this is my value

#### Decide which state to keep

Option 1: Overwrite Current state with Desire state main.tf file
You will loose your tag created via portal
```
terraform refresh
# Terraform will take a backup into terraform.tfstate.backup file and create new terraform.tfstate
terraform plan
terraform apply
```

Option 2: Sync main.tf file with current state
Manually add tag to your main.tf file


```HCL
cd 02-demo-resource-group-edit
terraform init

terraform refresh
# Terraform will take a backup into terraform.tfstate.backup file and create new terraform.tfstate

# Run plan to check the difference 
terraform plan
# Find new tag in the output window for example  [ - "portal-tag"  = "this is my value" -> null]
# Tip: check for - sign.
# Edit main.tf and copy the new changes

# Run plan again
terraform plan -out main.tfplan

terraform apply main.tfplan

# Clean up resources
# When you no longer need the resources created via Terraform, do the following steps:
# 1 - Run terraform plan and specify the destroy flag.
terraform plan -destroy -out main.destroy.tfplan
# 2 - terraform apply main.destroy.tfplan
terraform apply main.destroy.tfplan

```
</details>


<details>
<summary>Delete a specific resource from state</summary>

### terraform destroy -target=azurerm_resource_group.rg

> The -target option is not for routine use, and is provided only for exceptional situations such as recovering from errors or mistakes, or when Terraform specifically suggests to use it as part of an error message.

```HCL
cd 02-demo-resource-group
terraform init

# find name from main.tf file > resource "azurerm_resource_group" "rg" 
# use . in between 
terraform destroy -target=azurerm_resource_group.rg
```
</details>