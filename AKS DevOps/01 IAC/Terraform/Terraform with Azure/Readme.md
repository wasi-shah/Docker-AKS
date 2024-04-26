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

## Terraform resource graph
Terraform builds a resource graph to determine resource dependencies and creates or modifies non-dependent resources in parallel.
> [!note]
> You do not need to write step-by-step instructions to create resources because Terraform handles the underlying dependencies logic.


## Terraform state file
Terraform generates a plan and prompts you for your approval before modifying your infrastructure. It also keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.
> [!note]
> Terraform keeps track of your real infrastructure in a state file


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

- ### Authenticating to Azure using Managed Service Identity
Use Managed Service Identity when running Terraform non-interactively (such as when running Terraform in a CI server) 
- ### Authenticating to Azure using a Service Principal and a Client Certificate
Use Service Principal when running Terraform non-interactively (such as when running Terraform in a CI server) 
- ### Authenticating to Azure using a Service Principal and a Client Secret
- ### Authenticating to Azure using OpenID Connect
- ### Authenticating to Azure using AKS Workload Identity

> [!Important]
> Use a service principal or a managed identity when running Terraform non-interactively (such as when running Terraform in a CI/CD pipeline)
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