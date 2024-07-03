# Azure

> [!important]
> **Question: What is an Azure?** 
> <br>Azure is a cloud computing platform that allows you to access and manage cloud services and resources.


> [!important]
> **Question: What are Azure main services and resources categories?** 
> <br> Azure organised it's services and resources in categories, for example. 
> <br> Compute, Containers, Databases, Developer tools, DevOps, Hybrid + multicloud, Identity, Integration, Internet of Things, Management and governance, Media, Migration, Mixed reality, Mobile, Networking, Security, Storage, Virtual desktop infrastructure and Web.


# Azure Compute
> [!important]
> **Question: What are three main compute type/model?** 
> <br> **1. Public** - owned and run by third-party cloud service providers like Google Cloud, Azure and AWS
> <br> **2. Private** - you own all of the hardware or, at least, have complete control over it.
> <br> **3. Hybrid** - Environments that mix at least one private computing environment (traditional IT infrastructure or private cloud, including edge) with one or more public clouds are called hybrid clouds.

> [!important]
> **Question: What are four major compute services type/model?** 
> <br>
> <br> **1. Infrastructure as a service (IaaS)** - the service provider owns and operates the infrastructure/hardware, but customers will need to purchase and manage software, such as operating systems, middleware, data, and applications and also responsible for softwares for example VMs
> <br> **2. Platform as a service (PaaS)** - the service provider owns and mange OS and hardware but the customer is responsible for application and its configuration for example Web Apps
> <br> **3. Software as a service (SaaS)** - the provider owns the hardware, Os and the software but customer is only responsible for installing, configuring and using the software - for example MS Office and Dropbox.
> <br> **4. Serverless/Function as a Service** - provider is responsible for everything but customer is responsible for application and business logic.

The main three types of cloud computing are public cloud, private cloud, and hybrid cloud. Within these deployment models, there are four main services: infrastructure as a service (IaaS), platform as a service (PaaS), software as a service (SaaS), and serverless computing.

## Cloud Computing Types/Models

### Public
Public clouds deliver resources, such as compute, storage, network, develop-and-deploy environments, and applications over the internet. They are owned and run by third-party cloud service providers like Google Cloud, Azure and AWS.
In the public cloud model, you don’t own any hardware; your cloud vendor is responsible for purchasing and maintaining all hardware. The public cloud consists of all of the services and compute resources that you do not own yourself but that you use from your cloud provider. The provider is responsible for keeping everything running and adhering to Service-Level Agreements (SLAs). You pay for what you use, not for what you own.

### Private
With a private cloud, you own all of the hardware or, at least, have complete control over it. The hardware that runs your services and houses your data is somewhere in your on-premises datacentre. Of course, this complete control comes at a price: you must purchase and maintain everything. You pay for what you own, not for what you use. But, how do you set up a private cloud platform in a traditional on-premises datacentre. Fortunately, Azure provides a unique solution designed specifically to work in this environment: Azure Stack. In a nutshell, Azure Stack is your own private instance of Azure in a box that you can run in your on-premises datacentre.
Private clouds are built, run, and used by a single organization, typically located on-premises. They provide greater control, customization, and data security but come with similar costs and resource limitations associated with traditional IT environments.
### Hybrid
Environments that mix at least one private computing environment (traditional IT infrastructure or private cloud, including edge) with one or more public clouds are called hybrid clouds. They allow you to leverage the resources and services from different computing environments and choose which is the most optimal for the workloads.
The hybrid cloud model is, as its name implies, a mixture between the public and the private cloud. You can use public cloud services that use resources in your private cloud, and vice versa. In Azure, you could run an application in an Azure Web App that connects to an on-premises database using Azure Hybrid Connections. This opens a lot of possibilities. You control where your applications and data are while still gaining the benefits of using intelligent cloud services. Azure provides solutions for all cloud computing deployment types. This gives businesses more freedom to use Azure where and how they want to. And they can determine the amount of control that they want to have over their applications and data.
## Compute Computing Service Types/Models

### Infrastructure as a service (IaaS)
IaaS delivers on-demand infrastructure resources, such as compute, storage, networking, and virtualization. With IaaS, the service provider owns and operates the infrastructure, but customers will need to purchase and manage software, such as operating systems, middleware, data, and applications.
With infrastructure as a service (IaaS), you are responsible for softwares. Azure takes care of all the hardware, such as the solid-state drives (SSDs), network cabling, routers, power supplies, backup generators, cooling systems, and so on. 
Azure provides native support for IaC via the Azure Resource Manager model. Teams can define declarative ARM or Bicep templates that specify the infrastructure required to deploy solutions.
Services that fall into this category include 
•	Azure Virtual Machines
•	Azure Virtual Networks
•	Azure Container Instance.

### Platform as a service (PaaS)
Using the platform as a service (PaaS) model, you are responsible for your application and its configuration; Azure provides the OS and hardware. As Figure 1-1 demonstrates, PaaS is an abstraction level higher than IaaS. You have far fewer responsibilities but less direct control over your hardware resources than with IaaS. 
PaaS delivers and manages hardware and software resources for developing, testing, delivering, and managing cloud applications. Providers typically offer middleware, development tools, and cloud databases within their PaaS offerings.
Services that fall into the PaaS category include 
•	Azure App Service
•	Azure SQL Databases
•	Azure Redis Cache
•	Azure Batch.
•	AKS
•	Azure Container Apps

### Software as a service (SaaS)
With software as a service (SaaS [pronounced “sass”]), you need only concern yourself with installing and configuring the software—nothing else. For example Dropbox, MS Office, even a calculator is a SaaS example. Indeed, SaaS is the highest abstraction level of the cloud computing types. Services in the SaaS category include Azure Cognitive Services and Azure IoT Suite. Office 365 is another example of an Azure SaaS application suite, offering reliable business applications such as Microsoft Word, Excel, PowerPoint, and more. And all of this is available without you having to install or maintain anything. With SaaS, the software is ready to use. All you need to do is configure it to your preferences and then you are ready to go. You don’t write the software, and you don’t need to think about deployment, scaling, operating systems, and hardware.
SaaS provides a full application stack as a service that customers can access and use. SaaS solutions often come as ready-to-use applications, which are managed and maintained by the cloud service provider.

### Serverless/Function as a Service
Serverless computing in cloud service models is also called Function as a Service (FaaS). This is a relatively new cloud service model that provides solutions to build applications as simple, event-triggered functions without managing or scaling any infrastructure.
In function as a service (FaaS) you are responsible only for your application and your business logic. You don’t need to worry about scaling, the OS, or any of the hardware. FaaS is sometimes called serverless computing. 
Services in the FaaS category are 
• Azure Functions
• Azure Logic Apps
• Azure Event Grid.
In FaaS, all you need to do is create your application or weave together business logic and run it. Scaling happens automatically. One of the more noteworthy benefits of FaaS is that you pay for the resources you use only when the logic runs instead of paying for a service that is always on, waiting for somebody to use it. But FaaS does more than just host your application; it connects your logic to triggers and sources. Outside sources such as Azure Storage Queues or WebHooks can initiate Azure Functions or Logic Apps and provide them with data to process. You do not need to write the activating logic or set up the plumbing to connect to external data stores or services, meaning you can focus on your logic and customer-facing features.
