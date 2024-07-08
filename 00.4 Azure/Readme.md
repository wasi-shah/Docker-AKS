
# Azure

> [!important]
> **Question: What is an Azure?** 
> <br>Azure is a cloud computing platform that allows you to access and manage cloud services and resources.


> [!important]
> **Question: What are Azure's main services and resources categories?** 
> <br> Azure organised its services and resources in categories, for example. 
> <br> Compute, Containers, Databases, Developer tools, DevOps, Hybrid + multi-cloud, Identity, Integration, Internet of Things, Management and governance, Media, Migration, Mixed Reality, Mobile, Networking, Security, Storage, Virtual desktop infrastructure and Web.


# Azure Compute
> [!important]
> **Question: What are the three main compute types/model?** 
> <br> **1. Public** - owned and run by third-party cloud service providers like Google Cloud, Azure and AWS
> <br> **2. Private** - you own all of the hardware or, at least, have complete control over it.
> <br> **3. Hybrid** - Environments that mix at least one private computing environment (traditional IT infrastructure or private cloud, including edge) with one or more public clouds are called hybrid clouds.

> [!important]
> **Question: What are four major compute services types/model?** 
> <br>
> <br> **1. Infrastructure as a service (IaaS)** - the service provider owns and operates the infrastructure/hardware, but customers will need to purchase and manage software, such as operating systems, middleware, data, and applications and also responsible for software for example VMs
> <br> **2. Platform as a service (PaaS)** - the service provider owns and manage OS and hardware but the customer is responsible for the application and its configuration for example Web Apps
> <br> **3. Software as a service (SaaS)** - the provider owns the hardware, OS and software but the customer is only responsible for installing, configuring and using the software - for example MS Office and Dropbox.
> <br> **4. Serverless/Function as a Service** - The provider is responsible for everything but the customer is responsible for application and business logic for example Azure Functions, Azure Logic Apps, and Azure Event Grid.

The main three types of cloud computing are public, private, and hybrid. Within these deployment models, there are four main services: infrastructure as a service (IaaS), platform as a service (PaaS), software as a service (SaaS), and serverless computing.

## Cloud Computing Types/Models

### Public
Public clouds deliver resources, such as compute, storage, network, develop-and-deploy environments, and applications over the internet. They are owned and run by third-party cloud service providers like Google Cloud, Azure and AWS.
In the public cloud model, you don’t own any hardware; your cloud vendor is responsible for purchasing and maintaining all hardware. The public cloud consists of all of the services and compute resources that you do not own yourself but that you use from your cloud provider. The provider is responsible for keeping everything running and adhering to Service-Level Agreements (SLAs). You pay for what you use, not for what you own.

### Private
With a private cloud, you own all the hardware or, at least, have complete control over it. The hardware that runs your services and houses your data is somewhere in your on-premises data centre. Of course, this complete control comes at a price: you must purchase and maintain everything. You pay for what you own, not for what you use. But, how do you set up a private cloud platform in a traditional on-premises datacentre. Fortunately, Azure provides a unique solution designed specifically to work in this environment: Azure Stack. In a nutshell, Azure Stack is your own private instance of Azure in a box that you can run in your on-premises datacentre.
Private clouds are built, run, and used by a single organization, typically located on-premises. They provide greater control, customization, and data security but come with similar costs and resource limitations associated with traditional IT environments.
### Hybrid
Environments that mix at least one private computing environment (traditional IT infrastructure or private cloud, including edge) with one or more public clouds are called hybrid clouds. They allow you to leverage the resources and services from different computing environments and choose which is the most optimal for the workloads.
The hybrid cloud model is, as its name implies, a mixture between the public and the private cloud. You can use public cloud services that use resources in your private cloud, and vice versa. In Azure, you could run an application in an Azure Web App that connects to an on-premises database using Azure Hybrid Connections. This opens a lot of possibilities. You control where your applications and data are while still gaining the benefits of using intelligent cloud services. Azure provides solutions for all cloud computing deployment types. This gives businesses more freedom to use Azure where and how they want to. And they can determine the amount of control that they want to have over their applications and data.

## Compute Service Types/Models
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/a36026b7-6d84-4819-b0da-2793b5a0b21e)

### Infrastructure as a service (IaaS)
IaaS delivers on-demand infrastructure resources, such as compute, storage, networking, and virtualization. With IaaS, the service provider owns and operates the infrastructure, but customers will need to purchase and manage software, such as operating systems, middleware, data, and applications.
With infrastructure as a service (IaaS), you are responsible for software. Azure takes care of all the hardware, such as solid-state drives (SSDs), network cabling, routers, power supplies, backup generators, cooling systems, and so on. 
Azure provides native support for IaC via the Azure Resource Manager model. Teams can define declarative ARM or Bicep templates that specify the infrastructure required to deploy solutions.
Services that fall into this category include 
- Azure Virtual Machines 
- Azure Virtual Networks
- Azure Container Instance.

### Platform as a service (PaaS)
Using the platform as a service (PaaS) model, you are responsible for your application and its configuration; Azure provides the OS and hardware. As Figure 1-1 demonstrates, PaaS is an abstraction level higher than IaaS. You have far fewer responsibilities but less direct control over your hardware resources than with IaaS. 
PaaS delivers and manages hardware and software resources for developing, testing, delivering, and managing cloud applications. Providers typically offer middleware, development tools, and cloud databases within their PaaS offerings.
Services that fall into the PaaS category include 
- Azure App Service
- Azure SQL Databases
- Azure Redis Cache
- Azure Batch.
- AKS
- Azure Container Apps

### Software as a service (SaaS)
With software as a service (SaaS [pronounced “sass”]), you need only concern yourself with installing and configuring the software—nothing else. For example Dropbox, MS Office, and even a calculator is a SaaS example. Indeed, SaaS is the highest abstraction level of the cloud computing types. Services in the SaaS category include Azure Cognitive Services and Azure IoT Suite. Office 365 is another example of an Azure SaaS application suite, offering reliable business applications such as Microsoft Word, Excel, PowerPoint, and more. And all of this is available without you having to install or maintain anything. With SaaS, the software is ready to use. All you need to do is configure it to your preferences and then you are ready to go. You don’t write the software, and you don’t need to think about deployment, scaling, operating systems, and hardware.
SaaS provides a full application stack as a service that customers can access and use. SaaS solutions often come as ready-to-use applications, which are managed and maintained by the cloud service provider.

### Serverless/Function as a Service.
Serverless computing in cloud service models is also called Function as a Service (FaaS). This is a relatively new cloud service model that provides solutions to build applications as simple, event-triggered functions without managing or scaling any infrastructure.
In function as a service (FaaS) you are responsible only for your application and your business logic. You don’t need to worry about scaling, the OS, or any of the hardware. FaaS is sometimes called serverless computing. 
Services in the FaaS category are 
• Azure Functions
• Azure Logic Apps
• Azure Event Grid.
In FaaS, all you need to do is create your application or weave together business logic and run it. Scaling happens automatically. One of the more noteworthy benefits of FaaS is that you pay for the resources you use only when the logic runs instead of paying for a service that is always on, waiting for somebody to use it. But FaaS does more than just host your application; it connects your logic to triggers and sources. Outside sources such as Azure Storage Queues or WebHooks can initiate Azure Functions or Logic Apps and provide them with data to process. You do not need to write the activating logic or set up the plumbing to connect to external data stores or services, meaning you can focus on your logic and customer-facing features.


## Azure Compute Products 

**Virtual Machines (IaaS)**
Provision Linux and Windows virtual machines in seconds with the configurations of your choice. (see chapter for more details)

**Azure Kubernetes Service (AKS) (PaaS)**
Deploy and scale containers on managed Kubernetes.

**Azure Service Fabric (PaaS)**
Develop microservices and orchestrate containers on Windows and Linux

**Azure Container Instances (IaaS)**
Containerize apps and easily run containers with a single command.

**App Service (PaaS)**
Quickly create cloud apps for web and mobile with fully managed platform. You can host your applications in Azure App Service. Azure App Service is a collection of hosting and orchestrating services that share features and capabilities. For instance, all App Services have the capability to secure an application using Azure Active Directory and can use custom domains.
Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends. You can develop in your favourite language, be it .NET, .NET Core, Java, Node.js, PHP, and Python. Applications run and scale with ease on both Windows and Linux-based environments.

**Azure Functions (FaaS)**
Accelerate app development using 


---
# Azure Storage
---


![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/5cbaa486-7224-44af-935b-df5265edf292)

> [!important]
> **Question: What is Azure storage?** 
> <br>The Azure Storage platform is Microsoft's cloud storage solution for modern data storage scenarios. Azure Storage offers highly available, massively scalable, durable, and secure storage for a variety of data objects in the cloud. Azure Storage data objects are accessible from anywhere in the world over HTTP or HTTPS via a REST API.

> [!important]
> **Question: What are the key benefits of an Azure storage account?** 
> <br>Storage in Azure is highly available, secure, durable, scalable, and redundant.

> [!important]
> **Question: What is a region?** 
> <br> An Azure region is a geographical area in which one or more physical Azure data centers reside. Formula region = availability zone 1 + availability zone 2 + availability zone n


> [!important]
> **Question: What is an Availability zone?** 
> <br> Within a region, you have availability zones. Azure availability zones are physically and logically separated datacenters with their own independent power source, network, and cooling. Formula availability zone = data centre 1 + data centre 2 + data centre n


> [!important]
> **Question: What is an azure data centre?** 
> <br>An Azure data center is a unique physical building that contains thousands of physical servers with it's own power, cooling and networking infrastructure

> [!important]
> **Question: What are Azure data services** 
> <br>The Azure Storage platform includes the following data services:
> <br> **1. Azure Blobs:** A massively scalable object store for text and binary data. Also includes support for big data analytics through Data Lake Storage Gen2.
> <br> **2. Azure Files:** Managed file shares for cloud or on-premises deployments.
> <br> **3. Azure Elastic SAN:** A fully integrated solution that simplifies deploying, scaling, managing, and configuring a SAN in Azure.
> <br> **4. Azure Queues:** A messaging store for reliable messaging between application components.
> <br> **5. Azure Tables:** A NoSQL store for schemaless storage of structured data.
> <br> **6. Azure managed Disks:** Block-level storage volumes for Azure VMs.
> <br> **7. Azure Container Storage (preview):** A volume management, deployment, and orchestration service built natively for containers.


> [!important]
> **Question: What are Azure storage types** 
> -  **Standard general-purpose v2**:  [ available with Blob Storage (including Data Lake Storage1), Queue Storage, Table Storage, and Azure Files]
> -  **Premium**
>    - **Premium block blobs**:  [ available with Blob Storage (including Data Lake Storage1)]
>    - **Premium file shares**:  [Available with Azure Files]
>    - **Premium page blobs**:  [Available with Page blobs only]


> [!important]
> **Question: What is Azure storage redundancy and its types?** 
> <br> To ensure that your data is durable, Azure Storage stores multiple copies of your data. When you set up your storage account, you select a redundancy option.
> <br> **L means primary region/one data center. LRS means 3 copies. G means secondary region**
>  - Locally redundant storage 
>    - Locally redundant storage (LRS) – formula [Local/primary 3 copies]. Replicates your storage account three times within a single data center in the primary region. SLA 99.999999999% (11 nines).
>    - Zone-redundant storage – formula [LRS] + [1 Zone copy]. Replicates your storage account synchronously across three Azure availability zones in the primary region. SLA 99.9999999999% (12 9's).
>  - Redundancy in a secondary region
>    - Geo-redundant storage (GRS)-  formula [LRS] + [Second Region LRS] + copies your data asynchronously to a single physical location in the secondary region three times.
>    - Geo-zone-redundant storage (GZRS)  - formula [LRS] + [3 Zone copies] + [3 Secondary region Zone copies]
>    - Read Access Geo-zone-redundant storage (RA-GZRS) same as GZRS but you can read from the secondary region

> [!important]
> **Question: What are two blobs and their sizes?** 
> <br> **1.Page Blobs:** Max size 8 TB Page blob are optimized for random read and write operations. 
> <br> **2.Block Blobs:** Max size 190 TB Block blobs are optimized for efficiently uploading large amounts of data. These are perfect for storing large video files that don’t change often.  

> [!important]
> **Question: What is Azure file max size?** 
> <br>File Storage (Max size 100TB)

> [!important]
> **Question: what is Azure Queue and message size?** 
> <br>Maximum queue size 500 TB & Maximum message size 64 KB 



> [!important]
> **Question: what is Azure Table and row size?** 
> <br>Table has 5TB storage limit & 1 MB data per entry (per row)



> [!important]
> **Question: What are the three Managed Disk roles/types available?** 
> <br> 1. Data disk 
> <br> 2. OS disk
> <br> Temporary disk



> [!important]
> **Question: What are the two basic Storage performance tiers?** 
> <br> 1. **Standard:** This is HHD drive
> <br> 2. **Premium: SSD:** This is fast drive but only page blob. Premium do not support block blob, append blog, file share, tables and queues.


> [!important]
> **Question: What are four storage access tiers?** 
> <br> **1. Hot tier:** An online tier optimized for storing data that is accessed or modified frequently. The hot tier has the highest storage costs, but the lowest access costs.
> <br> **2. Cool tier:**  An online tier optimized for storing data that is infrequently accessed or modified. Data in the cool tier should be stored for a minimum of 30 days. The cool tier has lower storage costs and higher access costs compared to the hot tier. 
> <br> **3. Cold tier:**  An online tier optimized for storing data that is rarely accessed or modified, but still requires fast retrieval. Data in the cold tier should be stored for a minimum of 90 days. The cold tier has lower storage costs and higher access costs compared to the cool tier. 
> <br> **4. Archive tier:**  An offline tier optimized for storing data that is rarely accessed, and that has flexible latency requirements, on the order of hours. Data in the archive tier should be stored for a minimum of 180 days.

> [!important]
> **Question: What are the two Storage Encryption?** 
> <br> 1. **Microsoft-Managed-Keys (MMK):** Data in a new storage account is encrypted with Microsoft-managed keys by default.
> <br> 2. **Custom-Managed-Keys (CMK):** You can manage encryption with your own keys. If you choose to manage encryption with your own keys, you have two options. You can use either type of key management, or both

> [!important]
> **Question: What are the three Storage Identity and access management?** 
> <br> 1. **Access Keys:** When you create a storage account, Azure generates two 512-bit storage account access keys for that account. These keys can be used to authorize access to data in your storage account via Shared Key authorization, or via SAS tokens that are signed with the shared key.
> <br> 2. **Shared Access Keys:** A shared access signature (SAS) provides secure delegated access to resources in your storage account. With a SAS, you have granular control over how a client can access your data.
> <br> 2. **Microsoft Entra ID Integration:** Microsoft Entra integration for authorizing requests to blob, queue, and table resources. Microsoft recommends using Microsoft Entra credentials to authorize requests to data when possible for optimal security and ease of use. For more information about Microsoft Entra integration, see the articles for either blob, queue, or table resources. You can use Azure role-based access control (Azure RBAC) to manage a security principal's permissions to blob, queue, and table resources in a storage account. You can also use Azure attribute-based access control (ABAC) to add conditions to Azure role assignments for blob resources.


> [!important]
> **Question: What are the two ways to import/export Azure Data?** 
>  - Offline
>    - Data Box (100 TB), Data Box Disk (8 TB SSD x 5 =40 TB), and Data Box Heavy (1 PB) are offline data transfer devices which are shipped between your datacentre and Azure. Data Boxes use standard NAS protocols (SMB/CIFs and NFS), use AES encryption to protect your data, and perform a post-upload sanitization process to ensure that all data is wiped clean from the device.
>  - Online
>    - Data Box Gateway (1 TB) is an online data transfer product - a virtual appliance for moving data in and out of Azure.


## Azure data services
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/c81c4d0a-29ad-4005-a03b-34fb09342552)

### Azure Blobs
A massively scalable object store for text and binary data. Also includes support for big data analytics through Data Lake Storage Gen2.
You can use Azure Blob Storage to store large unstructured data—literally, blobs of data. This can be video, image, audio, or text, or even virtual hard drive (VHD) files for VMs. There are two types of Blobs: Page and Block Blobs. 
#### Page Blobs 
- Max size 8 TB
  
Page blob are optimized for random read and write operations. These are perfect for storing a VHD. 
#### Block Blobs
- Max size 190 TB

Block blobs are optimized for efficiently uploading large amounts of data. These are perfect for storing large video files that don’t change often.
### Azure Files
- File Storage (Max size 100TB).

You can use Azure File Storage as a drive from which to share files. It uses the Server Message Block (SMB) protocol, which means that you can use it with Windows and Linux, and you can access it from the cloud or from on-premises systems. Like the other Azure Storage types, File Storage is scalable and inexpensive. Managed file shares for cloud or on-premises deployments.
### Azure Queues
- Maximum queue size 500 TB
- Maximum message size 64 KB

Azure Queue Storage is an unusual type of storage in that it is used to store small messages of data, but its main purpose is to serve as a queue. You put messages on the queue and other processes pick it up. This pattern decouples the message sender from the message processor and results in performance and reliability benefits. Azure Queue Storage is based on the Microsoft Message Queueing that you can find in previous versions of Windows.
Azure Queue Storage is a service for storing large numbers of messages. You access messages from anywhere in the world via authenticated calls using HTTP or HTTPS. A queue message can be up to 64 KB in size. A queue may contain millions of messages, up to the total capacity limit of a storage account. Queues are commonly used to create a backlog of work to process asynchronously.
A messaging store for reliable messaging between application components.
### Azure Tables
- Table has a 5TB storage limit
- 1 MB of data per entry (per row)

A NoSQL store for schemaless storage of structured data.
Azure Table storage is a service that stores non-relational structured data (also known as structured NoSQL data) in the cloud, providing a key/attribute store with a schemaless design. Because Table storage is schemaless, it's easy to adapt your data as the needs of your application evolve. Access to Table storage data is fast and cost-effective for many types of applications, and is typically lower in cost than traditional SQL for similar volumes of data.
Azure Tables is a Flexible NoSQL database type storage, its ideal for semi-structured dataset where values are added in Key-value pairs. Table is an ideal solution for structures, semi-structured and non-structured data. You can use Tables to save your data to the tables and use OData-based queries to save and retrieve data. 
Table storage is excellent for flexible datasets – web app user data, address books, device information and other metadata – and lets you build cloud applications without locking down the data model to particular schemas. Because different rows in the same table can have a different structure – for example, order information in one row, and customer information in another.
### Azure managed Disks
Applies to: ✔️ Linux VMs ✔️ Windows VMs ✔️ Flexible scale sets ✔️ Uniform scale sets
Azure managed disks are block-level storage volumes that are managed by Azure and used with Azure Virtual Machines. Managed disks are like a physical disk in an on-premises server but, virtualized. With managed disks, all you have to do is specify the disk size, and the disk type, and provision the disk. Once you provision the disk, Azure handles the rest.
The available types of disks are ultra disks, premium solid-state drives (SSD), standard SSDs, and standard hard disk drives (HDD). For information about each individual disk type, see Select a disk type for IaaS VMs.
#### Disk roles
There are three main disk roles in Azure: the data disk, the OS disk, and the temporary disk. These roles map to disks that are attached to your virtual machine.
##### Data disk
A data disk is a managed disk that's attached to a virtual machine to store application data or other data you need to keep. Data disks are registered as SCSI drives and are labeled with a letter that you choose. The size of the virtual machine determines how many data disks you can attach to it and the type of storage you can use to host the disks.
##### OS disk
Every virtual machine has one attached operating system disk. That OS disk has a pre-installed OS, which was selected when the VM was created. This disk contains the boot volume.
This disk has a maximum capacity of 4,095 GiB. However, many operating systems are partitioned with master boot record (MBR) by default. MBR limits the usable size to 2 TiB. If you need more than 2 TiB, create and attach data disks and use them for data storage. If you need to store data on the OS disk and require the additional space, convert it to GUID Partition Table (GPT). To learn about the differences between MBR and GPT on Windows deployments, see Windows and GPT FAQ.
##### Temporary disk
Most VMs contain a temporary disk, which is not a managed disk. The temporary disk provides short-term storage for applications and processes and is intended to only store data such as page files, swap files, or SQL Server tempdb. Data on the temporary disk may be lost during a maintenance event when you redeploy a VM, or when you stop the VM. During a successful standard reboot of the VM, data on the temporary disk will persist. For more information about VMs without temporary disks, see Azure VM sizes with no local temporary disk.
On Azure Linux VMs, the temporary disk is typically /dev/sdb and on Windows VMs the temporary disk is D: by default. The temporary disk is not encrypted unless (for server-side encryption) you enable encryption at the host or (for Azure Disk Encryption) with the VolumeType parameter set to All on Windows or EncryptFormatAll on Linux.
### Azure Container Storage
A volume management, deployment, and orchestration service built natively for containers.
Azure Container Storage is a cloud-based volume management, deployment, and orchestration service built natively for containers. It integrates with Kubernetes, allowing you to dynamically and automatically provision persistent volumes to store data for stateful applications running on Kubernetes clusters.
## Azure Storage redundancy/replication
Azure Storage always stores multiple copies of your data so that it's protected from planned and unplanned events, including transient hardware failures, network or power outages, and massive natural disasters. Redundancy ensures that your storage account meets its availability and durability targets even in the face of failures.
### Redundancy in the primary region
Data in an Azure Storage account is always replicated three times in the primary region. Azure Storage offers two options for how your data is replicated in the primary region:
#### Locally redundant storage (LRS)
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/e57ce798-6b23-4c03-a769-340ece43f09e)

Locally redundant storage (LRS) copies your data synchronously three times within a single physical location in the primary region. LRS is the least expensive replication option but isn't recommended for applications requiring high availability or durability.
#### Zone-redundant storage (ZRS)
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/222c9761-47f5-457f-821e-4a0e35b75312)

Azure availability zones in the primary region. For applications requiring high availability, Microsoft recommends using ZRS in the primary region, and also replicating to a secondary region.
### Redundancy in a secondary region
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/e2df94e9-5933-49b4-8289-c4e8b415186e)

For applications requiring high durability, you can choose to additionally copy the data in your storage account to a secondary region that is hundreds of miles away from the primary region. If your storage account is copied to a secondary region, then your data is durable even in the case of a complete regional outage or a disaster in which the primary region isn't recoverable.
When you create a storage account, you select the primary region for the account. The paired secondary region is determined based on the primary region, and can't be changed. For more information about regions supported by Azure, see Azure regions.
Geo-redundant storage (GRS) copies your data synchronously three times within a single physical location in the primary region using LRS. It then copies your data asynchronously to a single physical location in a secondary region that is hundreds of miles away from the primary region. GRS offers durability for storage resources of at least 99.99999999999999% (16 9's) over a given year.
Azure Storage offers two options for copying your data to a secondary region:
Geo-redundant storage (GRS)
Geo-redundant storage (GRS) copies your data synchronously three times within a single physical location in the primary region using LRS. It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times using LRS.
#### Geo-zone-redundant storage (GZRS)
Geo-zone-redundant storage (GZRS) copies your data synchronously across three Azure availability zones in the primary region using ZRS. It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times using LRS.
#### Read-access geo-redundant storage (RA-GRS) & Read-access geo-zone-redundant storage (RA-GZRS)
With an account configured for GRS or GZRS only, data in the secondary region is not directly accessible to users or applications, unless a failover occurs. Read-access geo-redundant storage (RA-GRS) or read-access geo-zone-redundant storage (RA-GZRS) configurations permit read access to the secondary region.

## Azure Storage Performance Tiers
- Standard: This is HHD drive
- Premium: SSD: This is a fast drive but only a page blob. Premium does not support block blob, append blog, file share, tables and queues.

## Azure Storage Access Tier (Only available with standard storage)
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/b5b1a453-720f-4f99-910e-960c66c44087)

-	Hot tier - An online tier optimized for storing data that is accessed or modified frequently. The hot tier has the highest storage costs, but the lowest access costs.
-	Cool tier - An online tier optimized for storing data that is infrequently accessed or modified. Data in the cool tier should be stored for a minimum of 30 days. The cool tier has lower storage costs and higher access costs compared to the hot tier.
-	Cold tier - An online tier optimized for storing data that is rarely accessed or modified, but still requires fast retrieval. Data in the cold tier should be stored for a minimum of 90 days. The cold tier has lower storage costs and higher access costs compared to the cool tier.
-	Archive tier - An offline tier optimized for storing data that is rarely accessed, and that has flexible latency requirements, on the order of hours. Data in the archive tier should be stored for a minimum of 180 days.

## Azure Storage Encryption 
Azure Storage encryption is enabled for all storage accounts, including both Resource Manager and classic storage accounts. Azure Storage encryption cannot be disabled. Because your data is secured by default, you don't need to modify your code or applications to take advantage of Azure Storage encryption.
Types of Azure Storage Encryption
### 1.	Microsoft-Managed-Keys (MMK)
Data in a new storage account is encrypted with Microsoft-managed keys by default.
### 2.	Custom-Managed-Keys (CMK)
You can manage encryption with your own keys. If you choose to manage encryption with your own keys, you have two options. You can use either type of key management or both

## Azure Storage Identity and access management
### Access Keys
When you create a storage account, Azure generates two 512-bit storage account access keys for that account. These keys can be used to authorize access to data in your storage account via Shared Key authorization, or via SAS tokens that are signed with the shared key.
### Shared Access Keys
A shared access signature (SAS) provides secure delegated access to resources in your storage account. With SAS, you have granular control over how a client can access your data. For example:
-	What resources the client may access.
-	What permissions do they have to those resources?
-	How long the SAS is valid.
### Microsoft Entra ID Integration
Microsoft Entra integration for authorizing requests to blob, queue, and table resources. Microsoft recommends using Microsoft Entra credentials to authorize requests for data when possible for optimal security and ease of use. For more information about Microsoft Entra integration, see the articles for either blob, queue, or table resources.
You can use Azure role-based access control (Azure RBAC) to manage a security principal's permissions to blob, queue, and table resources in a storage account. You can also use Azure attribute-based access control (ABAC) to add conditions to Azure role assignments for blob resources.

## Azure Data Import/Export
Moving stored or in-flight data into the cloud is a challenge. Data Box devices provide solutions for both scenarios. Data Box devices easily move data to Azure when busy networks aren’t an option. Move large amounts of data to Azure when you're limited by time, network availability, or costs, using common copy tools such as Robocopy.
-	Data Box (100 TB), Data Box Disk (8 TB SSD x 5 =40 TB), and Data Box Heavy (1 PB) are offline data transfer devices which are shipped between your datacentre and Azure. Data Boxes use standard NAS protocols (SMB/CIFs and NFS), use AES encryption to protect your data, and perform a post-upload sanitization process to ensure that all data is wiped clean from the device.
-	Data Box Gateway (1 TB) is an online data transfer product - a virtual appliance for moving data in and out of Azure.


# Azure Networking
Azure networking provides the following services
- **Connectivity services**: Connect Azure resources and on-premises resources using any or a combination of these networking services in Azure - Virtual Network (VNet), Virtual WAN, ExpressRoute, VPN Gateway, NAT Gateway, Azure DNS, Peering service, Azure Virtual Network Manager, Route Server, and Azure Bastion.
- **Application protection services**: Protect your applications using any or a combination of these networking services in Azure - Load Balancer, Private Link, DDoS protection, Firewall, Network Security Groups, Web Application Firewall, and Virtual Network Endpoints.
- **Application delivery services**: Deliver applications in the Azure network using any or a combination of these networking services in Azure - Azure Front Door Service, Traffic Manager, Application Gateway, Internet Analyzer, and Load Balancer.
- **Network monitoring**: Monitor your network resources using any or a combination of these networking services in Azure - Network Watcher, ExpressRoute Monitor, Azure Monitor, or VNet Terminal Access Point (TAP).

> [!important]
> **Question: What is Azure DNS service?** 
> <br> Azure DNS service allow you to manage domain DNS records. Azure DNS is your domain control panel.


> [!important]
> **Question: What is Azure CDN?** 
> <br> Content Delivery Network helps reduce latency and improve performance by offloading static and media files to Azure global CDN network.


> [!important]
> **Question: What is Load balancing?** 
> <br> The term load balancing refers to the distribution of workloads across multiple computing resources.

> [!important]
> **Question: What are four Load balancing options available?** 
> <br> Azure Traffic Manager, Azure Load Balancer, Azure Application Gateway and Azure Front Door.


> [!important]
> **Question: What is Azure Traffic Manager?** 
> <br> Azure Traffic Manager operates at the DNS layer and distributes traffic based on DNS/user IP using DNS-based traffic routing methods [Layer 7/TCP/UDP].


> [!important]
> **Question: What is Azure Load Balancer?** 
> <br> Distributer traffic to a less busy VM. [Layer 4/TCP/UDP] 

> [!important]
> **Question: What is Azure Application Gateway?** 
> <br> Azure Application Gateway is a web traffic load balancer that route traffic based on the incoming URL. [Layer 7/TCP/HTTP/HTTPS] 


> [!important]
> **Question: What is Front Door?** 
> <br> Front Door is an Advance CDN with DDoS protection already built-in and can serve dynamic contents.

## Azure DNS
Host your Domain Name System (DNS) domain in Azure. Azure DNS is a hosting service for DNS domains that provides name resolution by using Microsoft Azure infrastructure. By hosting your domains in Azure, you can manage your DNS records by using the same credentials, APIs, tools, and billing as your other Azure services.
You can't use Azure DNS to buy a domain name. For an annual fee, you can buy a domain name by using App Service domains or a third-party domain name registrar. Your domains then can be hosted in Azure DNS for record management. For more information, see Delegate a domain to Azure DNS.
Azure DNS - It is a domain control panel. 
If you domain name servers are pointing to Azure, then this will become your traditional domain control panel.
If you are using MS name servers then your web app not automatically configured. You still need to add "A" records to connect your web app to DNS Zone 
It is like connecting a DNS Zone to a web app.
Azure DNS (Domain manager service) for DNS domains that provides name resolution by using Microsoft Azure infrastructure.
This involves you using a custom domain by using Microsoft DNS Zone service.

## Azure Content Delivery Network
Azure Content Delivery Network offers a global solution for rapidly delivering content. Save bandwidth and improve responsiveness when encoding or distributing gaming software, firmware updates, and IoT endpoints. Reduce load times for websites, mobile apps, and streaming media to increase user satisfaction globally.
Users expect a fast, reliable, and personalized web experience wherever they are. Content Delivery Network helps reduce latency and improve performance for high-bandwidth content by distributing user requests and serving content directly from edge servers. This brings the content closer to users and sends less traffic to the origin point, delivering superior online experiences.


## Azure load balancing services
The term load balancing refers to the distribution of workloads across multiple computing resources.

### Azure Traffic Manager
![tm](https://github.com/wasi-shah/Docker-AKS/assets/51749920/f3d43777-a6a3-4d05-acc7-f8dfbfb4685b)

Azure Traffic Manager operates at the DNS layer to quickly and efficiently direct incoming DNS requests based on the routing method of your choice. An example would be sending requests to the closest endpoints, improving the responsiveness of your applications.
Distribute traffic optimally to services across global Azure regions—with DNS-based traffic routing methods. Prioritize user access, help ensure adherence to data sovereignty, and adjust traffic for app upgrades and maintenance.
Supports:
- HTTP, HTTPS, HTTP/2, TCP, UDP
- Layer 7
- Global apps

### Azure Load Balancer
![lb](https://github.com/wasi-shah/Docker-AKS/assets/51749920/fb2121ca-f112-4039-a3a2-0547437cba6c)

This is a traditional load balance that can work for all ports and applications, if you just want to load balance a website then you may need an application gateway which is specially designed for HTTP and HHTPS means for port 80 and port 443. With Azure Load Balancer you can scale your applications and create high availability for your services. Load Balancer supports inbound and outbound scenarios, provides low latency and high throughput, and scales up to millions of flows for all TCP and UDP applications.
Load Balancer types
Public: A public load balancer maps the public IP address and port number of incoming traffic to the private IP address and port number of the VM
Internal: An internal load balancer directs traffic only to resources that are inside a virtual network or that use a VPN to access Azure infrastructure.
Build high availability and network performance into your applications with low-latency layer 4 load balancing capabilities. Balance traffic between virtual machines (VMs) inside your virtual networks and across multitiered hybrid apps.
Supports:
- TCP, UDP
- Layer 4
- Global and regional apps

### Azure Application Gateway
![Azure Application Gateway](https://github.com/wasi-shah/Docker-AKS/assets/51749920/54520757-45c8-4d6b-9c36-5da42849eebb)

Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications. With an Application gateway for even defining a server for a URL path, it is amazing. For example, you can route traffic based on the incoming URL. So if /images are in the incoming URL, you can route traffic to a specific set of servers (known as a pool) configured for images. If /video is in the URL, that traffic is routed to another pool optimized for videos. Application gateway also inspects data and protects you from SQL injection for example.
Transform web front ends into scalable and highly available apps using layer 7 load balancing capabilities. Distribute regional applications more securely.
Supports:
- HTTP, HTTPS, HTTP/2
- Layer 7
- Regional apps
- Web application firewall
- SSL/TLS offloading

### Azure Front Door
![Front Door](https://github.com/wasi-shah/Docker-AKS/assets/51749920/57beb603-1c61-4f52-8ae3-1134f98571eb)

Azure Front Door is a modern cloud content delivery network (CDN) service that delivers high performance, scalability, and secure user experiences for your content and applications.
Deliver real-time performance of global web applications using the Microsoft global edge network. Accelerate content and transform multiple microservice applications into a single more secure app delivery architecture.
Supports:
- HTTP, HTTPS, HTTP/2 
- Layer 7
- Global apps
- Web application firewall
- SSL/TLS offloading


> [!important]
> **Question: What is Azure Virtual Network?** 
> <br> Azure Virtual Network is your private network in Azure. You can deploy VMs and other types of Azure resources in a virtual network. Examples of resources include App Service Environments, Azure Kubernetes Service (AKS), and Azure Virtual Machine Scale Sets. 


> [!important]
> **Question: What is Subnets?** 
> <br> Subnets enable you to segment the virtual network into one or more subnetworks and allocate a portion of the virtual network's address space to each subnet.


> [!important]
> **Question: What is Virtual network peering?** 
> <br> By default resources in different VNets can’t talk to each other. You can connect virtual networks to each other by using virtual peering.


> [!important]
> **Question: How can you connect yur own-prem resources to Azure?** 
> <br> You can connect your on-premises computers and networks to a virtual network by using any of the following options:
> - Point-to-site virtual private network (VPN)
>   - your office computer to azure vnet using public internet.
>   - lets you create a secure connection to your azure virtual network from an office/on-prem client computer.
>   - Install software on PC
>   - Data travel over public internet
> - Site-to-site VPN
>   - your office network to azure vnet using public internet.
>   - A Site-to-Site VPN gateway connection is used to connect your on-premises network to an Azure virtual network
>   - Install physical VPN gateway on prem
>   - Data travel over public internet
> - Azure ExpressRoute
>   - your office network to azure vnet using **private** internet.
>   - ExpressRoute lets you extend your on-premises networks into the Microsoft cloud over a private connection
>   - Data travel over **private** internet

> [!important]
> **Question: What is Network security groups?** 
> <br> NSG defines which traffic is allowed and which traffic is blocked. It’s a security guard. NSG can be attached to A Network interface and A Subnet and can define Inbound and Outbound traffic rules.



## Azure Virtual Network
![Azure Virtual Network](https://github.com/wasi-shah/Docker-AKS/assets/51749920/da47b0d7-bc68-42ab-93c6-6911022af7b2)

Azure Virtual Network is a service that provides the fundamental building block for your private network in Azure. An instance of the service (a virtual network) enables many types of Azure resources to securely communicate with each other, the internet, and on-premises networks. These Azure resources include virtual machines (VMs).
A virtual network is similar to a traditional network that you'd operate in your own datacenter. But it brings extra benefits of the Azure infrastructure, such as scale, availability, and isolation.

### Communication of Azure resources with the internet.
All resources in a virtual network can communicate outbound with the internet, by default. You can also use a public IP address, NAT gateway, or public load balancer to manage your outbound connections. You can communicate inbound with a resource by assigning a public IP address or a public load balancer.



### Communication between Azure resources.
Azure resources communicate securely with each other in one of the following ways:
- Virtual network 
- Virtual network service endpoint
- Virtual network peering

#### Virtual network 
You can deploy VMs and other types of Azure resources in a virtual network. Examples of resources include App Service Environments, Azure Kubernetes Service (AKS), and Azure Virtual Machine Scale Sets. To view a complete list of Azure resources that you can deploy in a virtual network, see Deploy dedicated Azure services into virtual networks.

**Address space**: When creating a virtual network, you must specify a custom private IP address space using public and private (RFC 1918) addresses. Azure assigns resources in a virtual network a private IP address from the address space that you assign. For example, if you deploy a VM in a virtual network with address space, 10.0.0.0/16, the VM is assigned a private IP like 10.0.0.4.

**Subnets**: Subnets enable you to segment the virtual network into one or more subnetworks and allocate a portion of the virtual network's address space to each subnet. You can then deploy Azure resources in a specific subnet. Just like in a traditional network, subnets allow you to segment your virtual network address space into segments that are appropriate for the organization's internal network. Segmentation improves address allocation efficiency. You can secure resources within subnets using Network Security Groups. For more information, see Network security groups.

**Regions**: A virtual network is scoped to a single region/location; however, multiple virtual networks from different regions can be connected together using Virtual Network Peering.

**Subscription**: A virtual network is scoped to a subscription. You can implement multiple virtual networks within each Azure subscription and Azure region.



#### Virtual network service endpoint
You can extend your virtual network's private address space and the identity of your virtual network to Azure service resources over a direct connection. Examples of resources include Azure Storage accounts and Azure SQL Database. Service endpoints allow you to secure your critical Azure service resources to only a virtual network. To learn more, see Virtual network service endpoints.



#### Virtual network peering
By default resources in different VNets can’t talk to each other. 
You can connect virtual networks to each other by using virtual peering. The resources in either virtual network can then communicate with each other. The virtual networks that you connect can be in the same, or different, Azure regions. To learn more, see Virtual network peering.
> [!Tip]
> Global Vnet peering is when you peer two Vnet in different regions.



### Communication with on-premises resources.
You can connect your on-premises computers and networks to a virtual network by using any of the following options:
- Point-to-site virtual private network (VPN)
- Site-to-site VPN
- Azure ExpressRoute
 
#### Point-to-site virtual private network (VPN)
- Install software on PC
- Data travel over public internet
- If you make a change to the topology of your network and have Windows VPN clients, the VPN client package for Windows clients must be downloaded and installed again in order for the changes to be applied to the client.
					
Established between a virtual network and a single computer in your local/office network. Each computer that wants to establish connectivity with a virtual network must configure its connection. This connection type is useful if you're just getting started with Azure, or for developers, because it requires few or no changes to an existing network. The communication between your computer and a virtual network is sent through an encrypted tunnel over the internet. To learn more, see About point-to-site VPN.

#### Site-to-site VPN
- Install physical VPN gateway on prem
- Data travel over public internet
Established between your on-premises VPN device and an Azure VPN gateway that's deployed in a virtual network. This connection type enables any on-premises resource that you authorize to access a virtual network. The communication between your on-premises VPN device and an Azure VPN gateway is sent through an encrypted tunnel over the internet. To learn more, see Site-to-site VPN.

#### Azure ExpressRoute
- It’s a faster private connection to Azure
- You don’t use public internet
- Fast and expensive
- You need to talk to your broadband provider to set a connection
- Microsoft has a list of vendor which can provide you high speed private internet connection.
- Costly as you pay for speed and data.
Established between your network and Azure, through an ExpressRoute partner. This connection is private.
Experience a fast, reliable, and private connection to Azure. Use Azure ExpressRoute to create private connections between Azure datacenters and infrastructure on premises or in a colocation environment. ExpressRoute connections don't route through the public internet, and they offer more reliability, faster speed, and lower latency than typical internet connections. In some cases, using ExpressRoute connections to transfer data between on-premises systems and Azure gives you significant cost benefits.

### Virtual Network Gateway
Azure VPN Gateway is a service that uses a specific type of virtual network gateway to send encrypted traffic between an Azure virtual network and on-premises locations over the public Internet. You can also use VPN Gateway to send encrypted traffic between Azure virtual networks over the Microsoft network. Multiple connections can be created to the same VPN gateway. When you create multiple connections, all VPN tunnels share the available gateway bandwidth.
You can also use virtual network gateway to communicate VNets in different regions. This is called VNet to VNet connection.

### Security & Filtering of network traffic.
You can filter network traffic between subnets by using either or both of the following options:
- Network security groups [NSG]
- Network virtual appliances
  
#### Network security groups
Network security groups and application security groups can contain multiple inbound and outbound security rules. These rules enable you to filter traffic to and from resources by source and destination IP address, port, and protocol.
NSG defines which traffic is allowed and which traffic is blocked. It’s a security guard in the middle which checks the incoming request (what is source IP, what is destination IP, what is the destination port) and decides if that request is allowed or denied. 
- NSG can be attached to 
  - A Network interface
    - If you attach a NSG to network interface then it is a security guard between Subnet and Network interface
  - A Subnet
    - If you attach a NSG to a subnet then it is a security guard between Vnet and subnet (technically a guard between other subnets in the vnet)
- NSG rules
  - Inbound rules 
    - Rules that applies when a request comes
  - Outbound rules
    - Rules that applies when the response sent or the requested resource further requests another resource

#### Network virtual appliances
A network virtual appliance is a VM that performs a network function, such as a firewall or WAN optimization. To view a list of available network virtual appliances that you can deploy in a virtual network, go to Azure Marketplace.

### Routing of network traffic.
Azure routes traffic between subnets, connected virtual networks, on-premises networks, and the internet, by default. You can implement either or both of the following options to override the default routes that Azure creates:
- Route tables: You can create custom route tables that control where traffic is routed to for each subnet.
- Border gateway protocol (BGP) routes: If you connect your virtual network to your on-premises network by using an Azure VPN gateway or an ExpressRoute connection, you can propagate your on-premises BGP routes to your virtual networks.

### Integration with Azure services.
Integrating Azure services with an Azure virtual network enables private access to the service from virtual machines or compute resources in the virtual network. You can use the following options for this integration:
- Deploy dedicated instances of the service into a virtual network. The services can then be privately accessed within the virtual network and from on-premises networks.
- Use Azure Private Link to privately access a specific instance of the service from your virtual network and from on-premises networks.
- Access the service over public endpoints by extending a virtual network to the service, through service endpoints. Service endpoints allow service resources to be secured to the virtual network.


## Monitoring/Troubleshooting Azure Virtual Networks

### Network Watcher
- Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level.
- Network Watcher is designed to monitor and repair the network health of IaaS (Infrastructure-as-a-Service) products which includes Virtual Machines, Virtual Networks, Application Gateways, Load balancers, etc. 
- Note: It is not intended for and will not work for PaaS monitoring or Web analytics.
- It can do
#### NSG diagnostics
The NSG diagnostics is an Azure Network Watcher tool that helps you understand which network traffic is allowed or denied in your Azure virtual network along with detailed information for debugging. NSG diagnostics can help you verify that your network security group rules are set up properly.
#### IP flow verify
- Network Watcher IP flow verify checks if a packet is allowed or denied to or from a virtual machine based on 5-tuple information. The security group decision and the name of the rule that denied the packet is returned.
- You can test something like if a one vm ip can reach another vm ip on port 80 for example.
#### Next hop
- Next Hop provides the next hop from the target virtual machine to the destination IP address.
- It validates outbound connectivity from Azure Virtual machine to an external host.

#### Network packet capture
- Network Watcher packet capture allows you to create capture sessions to track traffic to and from a virtual machine. 

#### Connection Monitor
- It enables you to configure and track connection reachability, latency, and network topology changes. If there is an issue, it tells you why it occurred and how to fix it.
- You can inspect all network traffic from one VM to another VM.

### Topology Tool/Viewer
Topology provides a visualization of the entire network for understanding network configuration. It provides an interactive interface to view resources and their relationships in Azure across multiple subscriptions, resource groups and locations. You can also drill down to a resource view for resources to view their component level visualization.


# Azure Governance

![AzureAccountStructurev2](https://github.com/wasi-shah/Docker-AKS/assets/51749920/43ede4f8-be41-40f6-b10f-37081a7aa135)

> [!important]
> **Question: Define azure governance structure?** 
> <br> Tenant > Management Group > Subscription > Resource Group > Resources



> [!important]
> **Question: What is a Azure account?** 
> <br> Azure account is used as a authentication mechanism. Every Azure account is part of one Azure tenant.
> - Azure account types
>   - User, Application (called managed identity)    
> - Account access types
>   - Owner, Contributor, Reader or Custom

> [!important]
> **Question: What is a Role?** 
> <br> A role definition is a collection of permissions. You can use a pre-defined role or create a custom role.


> [!important]
> **Question: How can you apply restrictions on Azure resources?** 
> <br> There are two ways to control azure
> - **RBAC** - manage who has access to Azure resources, what they can do with those resources, and what areas they have access to.
> - **Policies** - Azure Policy helps to enforce organizational standards for example you can enforce resource creation in certain regions only.



## Azure Account
- The Azure account is a global unique entity that gets you access to Azure services and your Azure subscriptions.
- Azure account types
  - User
  - Application (called managed identity)
- Account access types
  - Owner
  - Contributor
  - Reader
  - Custom 
- Used as a authentication mechanism.
- Every Azure account is part of one Azure tenant.
- 
## Tenant
- Azure tenant is a organisation or a company.
- Azure gives you a default subdomain for tenant.
- You can add your custom domain instead.
-  Gives you dedicated instance of Azure Intra ID (AAD). 



## Management Group
Management groups provide a governance scope above subscriptions. You organize subscriptions into management groups; the governance conditions you apply cascade by inheritance to all associated subscriptions.
Management groups give you enterprise-grade management at scale, no matter what type of subscriptions you might have. However, all subscriptions within a single management group must trust the same Azure Active Directory (Azure AD) tenant.


## Subscription
- Azure subscription is your billing identity. 
- The container where your created resources are created.
- Resources from one subscription are isolated from resources in other subscriptions.
- Once tenant can have multiple subscriptions. BUT one subscription can only part of once tenant.
- Organizations might have several Azure credit subscriptions. Each subscription an organization sets up is associated with an Microsoft Entra ID.
- You can move subscription from one Entra directory to other Entra directory.
- An organization can have zero or multiple subscriptions.
  - A subscription can have multiple licenses.
  - Licenses can be assigned to individual user accounts.
  - User accounts are stored in a Microsoft Entra tenant.
- Common types of Azure subscriptions
  - Free
  - PAYG
  - Enterprise


## Resources
All items azure offers including Azure compute, storage, networking etc.

## Resource Group
A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

The resource group stores metadata about the resources. Therefore, when you specify a location for the resource group, you are specifying where that metadata is stored. For compliance reasons, you may need to ensure that your data is stored in a particular region.


## Role Base Access controls (RBAC)
Azure role-based access control (Azure RBAC) helps you manage who has access to Azure resources, what they can do with those resources, and what areas they have access to.
### Role
A role definition is a collection of permissions. It's typically just called a role. A role definition lists the actions that can be performed, such as read, write, and delete. Roles can be high-level, like owner, or specific, like virtual machine reader.
**Built-in roles for Azure Resources**
Role-based access control (RBAC) has several built-in roles for Azure resources that you can assign to users, groups, service principals, and managed identities. Role assignments are the way you control access to Azure resources. If the built-in roles don't meet the specific needs of your organization, you can create your own custom roles for Azure resources.
 There are three basic roles
 Owner: Can do all action
Contributor: Can't edit existing resources but can create new
Reader: Can only read resources. He can't read secrets and Cost.

### Scope
Scope is the set of resources that the access applies to. When you assign a role, you can further limit the actions allowed by defining a scope. This is helpful if you want to make someone a Website Contributor, but only for one resource group.
Scope Levels
In Azure, you can specify a scope at four levels: management group, subscription, resource group, or resource. Scopes are structured in a parent-child relationship. You can assign roles at any of these levels of scope.

### Role assignments
A role assignment is the process of attaching a role definition to a user, group, service principal, or managed identity at a particular scope for the purpose of granting access. Access is granted by creating a role assignment, and access is revoked by removing a role assignment. 

**Role Assignment to Security principal**
A security principal is an object that represents a user, group, service principal, or managed identity that is requesting access to Azure resources. You can assign a role to any of these security principals.
Tip: Service principal - It mostly used to perform management tasks. An Azure service principal is a security identity used by user-created apps, services, and automation tools like CICD to access specific Azure resources. Think of it as a 'user identity' (login and password or certificate) with a specific role, and tightly controlled permissions to access your resources. It only needs to be able to do specific things, unlike a general user identity. It improves security if you only grant it the minimum permissions level needed to perform its management tasks.

**Role Assignment to Group**
Role assignments are transitive for groups which means that if a user is a member of a group and that group is a member of another group that has a role assignment, the user will have the permissions in the role assignment.

**Multiple role assignments**
So what happens if you have multiple overlapping role assignments? Azure RBAC is an additive model, so your effective permissions are the sum of your role assignments. Consider the following example where a user is granted the Contributor role at the subscription scope and the Reader role on a resource group. The sum of the Contributor permissions and the Reader permissions is effectively the Contributor role for the subscription. Therefore, in this case, the Reader role assignment has no impact.
Multiple Role inheritance and priority.
If you have more than one role assign to a scope then it follows this sequence.
1.	Management Group
2.	Subscription
3.	Resource Group
4.	Individual Resource

### RBAC Monitoring (Azure Activity Log)
Activity Log provides data about the external operations that are performed on a resource by management activity. This log can be used to audit RBAC. Activity log records a lot of other management activities, so you need to filter it to get the RBAC activities only.
Whenever a change is made to RBAC definition and role assignment, the details are recorded in Azure Activity Log.  The Azure Activity Log provides insight into subscription-level management events that have occurred in Azure.
Use the Activity Log, to determine the what, who, and when for any write operations  taken on the resources in your subscription.
The following  RBAC related operations are written in Activity Log, 
1. For built-in roles
   - When you create/update/delete a new role assignment for built-in roles
2. For Custom Roles
   - When you create/update/delete a custom role.
   - When you create/update/delete a new role assignment for custom roles
How to filter Activity Log to view RBAC events.
1. Apply [Administrator] Filter on events.
2. Apply following filters on Operation 
   - Create role assignment
   - Delete role assignment
   - Create or update custom role definition 
                         d. Delete custom role definition
### RBAC Tips
Tips and tricks to avoid RBAC issues
- Organise your resources in correct resource group.
- Avoid assigning RBAC on subscription level.
- These days organizations are moving sensitive data into a separate subscription or management group which is good.
- Avoid RBAC on a single resource level
- Use builtin role where possible
- Assign role on group level (not user level )
- Avoid assigning permission to someone Microsoft account. Always create an Azure AZ user account and assign permission to that account so if he leaves you can control his account.
- Use RBAC with service to support CICD


## Policies
Azure Policy helps to enforce organizational standards and to assess compliance at-scale. Through its compliance dashboard, it provides an aggregated view to evaluate the overall state of the environment, with the ability to drill down to the per-resource, per-policy granularity. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources.

### Policy Definition
The journey of creating and implementing a policy in Azure Policy begins with creating a policy definition. Every policy definition has conditions under which it's enforced. And, it has a defined effect that takes place if the conditions are met.
In Azure Policy, we offer several built-in policies that are available by default. For example:
- Allowed Storage Account SKUs (Deny): Determines if a storage account being deployed is within a set of SKU sizes. Its effect is to deny all storage accounts that don't adhere to the set of defined SKU sizes.
- Allowed Resource Type (Deny): Defines the resource types that you can deploy. Its effect is to deny all resources that aren't part of this defined list.
- Allowed Locations (Deny): Restricts the available locations for new resources. Its effect is used to enforce your geo-compliance requirements.
- Allowed Virtual Machine SKUs (Deny): Specifies a set of virtual machine SKUs that you can deploy.
- Add a tag to resources (Modify): Applies a required tag and its default value if it's not specified by the deploy request.
- Not allowed resource types (Deny): Prevents a list of resource types from being deployed.

### Policy Assignments
An assignment is a policy definition or initiative that has been assigned to a specific scope. This scope could range from a management group to an individual resource. The term scope refers to all the resources, resource groups, subscriptions, or management groups that the definition is assigned to. Assignments are inherited by all child resources. This design means that a definition applied to a resource group is also applied to resources in that resource group. However, you can exclude a subscope from the assignment.
For example, at the subscription scope, you can assign a definition that prevents the creation of networking resources. You could exclude a resource group in that subscription that is intended for networking infrastructure. You then grant access to this networking resource group to users that you trust with creating networking resources.





## Microsoft Entra ID Protection
Microsoft Entra ID Protection helps organizations detect, investigate, and remediate identity-based risks. These identity-based risks can be further fed into tools like Conditional Access to make access decisions or fed back to a security information and event management (SIEM) tool for further investigation and correlation.




## Azure Blueprints
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/9d51b918-6078-445b-93bb-90a2b4160ec7)

Accelerate migration by easily deploying a fully governed landing zone, without the need for external cloud architects or engagements. Reuse cloud-based blueprints for future environments or use built-in blueprints to set up ISO-compliant foundational architectures.
In modern azure architecture there is concept of blue print. Blue Prints deploy and updates the cloud environment is a repeatable manner using composable artifacts.
Blueprint consists of following artifacts [ RBAC + Policies + IAC]

## Azure Governance best practice
If I manage a big infrastructure, then. 
- I will also use Azure Management group to make sure the subscriptions are in a dedicated group. 
- I will use policies to force the resource creating
- I will use the RBAC to force the access control and access level.
- I will use Azure cost management to keep control of cost and put cost related constraint.
- I will use Azure Blue Print to deploy and control my infrastructure.



# Manage Entra ID (Azure Active Directory)

> [!important]
> **Question: What is a Manage Entra ID types and their sub-types?** 
> <br> Microsoft’s cloud-based identity and access management service provides user management system.
> <br> It gives your apps (services principle/managed identities), people (your domain name users), partners (guest users), and customers (your app users) a single identity to access the applications they want and collaborate from any platform and device.

> [!important]
> **Question: What are Microsoft Entra tenant Types?** 
> 1. **Microsoft Entra tenant** - A Microsoft Entra tenant represents an organization
> - **User-based service accounts** It’s a basic general purpose user account. 
> - **Managed identities** Managed identities are secure Microsoft Entra identities created to provide identities for Azure resources.
> - **Service principals** Service accounts are a special type of account that is intended to represent a non-human entity such as an application
> 2. **Azure AD B2C tenant** - An Azure AD B2C tenant represents a collection of identities to be used with relying party applications.
> - **Work account**. Employees which want to access azure portal. A work account can access resources in a tenant, and with an administrator role, can manage tenants.
> - **Guest account** An external consultant that can only manage Azure active directory users. A guest account can only be a Microsoft account or an Azure Active Directory user that can be used to access applications or manage tenants.
> - **Consumer account** (your own asp.net app) Your app customers. Then can't access Azure portal and they can't access Azure resources

> [!important]
> **Question: What are Service Account Types?** 
> <br> 1. **User-based service accounts** It’s a basic general purpose user account. 
> <br> 2. **Managed identities** Managed identities are secure Microsoft Entra identities created to provide identities for Azure resources.
> <br> 3. **Service principals** Service accounts are a special type of account that is intended to represent a non-human entity such as an application


Azure Entra ID is Microsoft’s cloud-based identity and access management service, which helps your employees sign in and access resources in:
- External resources, such as Microsoft Office 365, the Azure portal, and thousands of other SaaS applications.
- Internal resources, such as apps on your corporate network and intranet (B2B), along with any cloud apps developed by your own organization (B2C).
- The Azure Active Directory (Azure AD) enterprise identity service provides SSO and multi-factor authentication to help protect your users from 99.9 per cent of cybersecurity attacks.
- It’s a user management system
- Azure Active Directory is a cloud identity and access management solution that combines easy single sign-on to any cloud and on-premises application with advanced protection. 
- It gives your people (your domain name users), partners (guest users), and customers (your app users) a single identity to access the applications they want and  collaborate from any platform and device. 
- And because it’s based on scalable management capabilities and risk-based access rules, Azure Active  Directory protects your identities and streamlines IT processes.
- Integrate your on-premises Active Directory and other directories with Azure AD through Azure AD Connect and use one identity to access any app. 
- Add your own SaaS or custom apps (B2C)
- Users can securely manage their own services, like application requests, changing passwords and join or create groups. 
- Add policies/rules based on user information.
- Self Service really helps.  Keep IT overhead low with self-service capabilities, including password resets, group and application management. 
- Conditional access policies based on location, application sensitivity, device state, and user or sign-in risk
- Built in multifactor authentication gives you an additional layer of authentication protection.
- Identity protection insights for user, sign-in and configuration risk 
- Privileged identity management helps you discover, restrict, and monitor administrators 
- Provide just-in-time administration for eligible users.

## Microsoft Entra tenant Types
Microsoft Entra ID and Azure AD B2C are separate product offerings.
- Microsoft Entra tenant
  - A Microsoft Entra tenant represents an organization.
- Azure AD B2C tenant
  - An Azure AD B2C tenant represents a collection of identities to be used with relying party applications.
  - By default, each B2C tenant can accommodate a total of 1.25 million objects (user accounts and applications), but you can increase this limit to 5.25 million objects when you add and verify a custom domain.

## Entra ID Service Account Types: 
There are three types of service accounts native to Microsoft Entra ID: 

**Managed identities**
Managed identities are secure Microsoft Entra identities created to provide identities for Azure resources.

**Service principals**
Service accounts are a special type of account that is intended to represent a non-human entity such as an application, API, or other service.
If you can't use a managed identity to represent your application, use a service principal. Service principals can be used with both single tenant and multi-tenant applications.
A service principal is the local representation of an application object in a single Microsoft Entra tenant. It functions as the identity of the application instance, defines who can access the application, and what resources the application can access. A service principal is created in (local to) each tenant where the application is used and references the globally unique application object. The tenant secures the service principal's sign-in and access to resources.
There are two mechanisms for authentication using service principals—client certificates and client secrets. Certificates are more secure: use client certificates if possible. Unlike client secrets, client certificates cannot accidentally be embedded in code.	 

**User-based service accounts**
It’s a user account.

## Azure Entra ID B2C
In Azure Active Directory B2C (Azure AD B2C), you can use different types of accounts. Azure Active Directory, Azure Active Directory B2B, and Azure Active Directory B2C share in the types of user accounts that can be used.
Users create is Azure AD are different from  Users created in Azure B2C User
The following types of accounts are available:

**Work account.**
Employees which want to access azure portal. A work account can access resources in a tenant, and with an administrator role, can manage tenants.

**Guest account**
An external consultant that can only manage Azure active directory users. A guest account can only be a Microsoft account or an Azure Active Directory user that can be used to access applications or manage tenants.

**Consumer account (your own asp.net app)**
Your app customers. Then can't access Azure portal and they can't access Azure resources. A consumer account is created by going through a sign-up user flow in an Azure AD B2C application or by using Azure AD Graph API, and is used by users of the applications that are registered with Azure AD B2C.
Azure AD B2C is primarily for businesses and developers that create customer-facing apps. With Azure AD B2C, developers can use Azure AD as the full-featured identity system for their application, while letting customers sign in with an identity they already have established (like Facebook or Gmail).
- Ideal for B2C web app
- Create user in your web app
- Customers of your mobile and web apps, whether individuals, institutional or organizational customers into your Azure AD.
- User can use their own personal email or facebook to register / login
- Internal AD user can login too.
- Single sign on (SSO) to your own ASP.Net web apps within the Azure AD B2C tenants is supported.
- You can create login pages, they can change their password. You can restrict them, enable multi factor authentication.

# Databases on Azure
![rdb](https://github.com/wasi-shah/Docker-AKS/assets/51749920/d5a42d09-0926-4190-be06-ed522de682dd)

![non-rdb](https://github.com/wasi-shah/Docker-AKS/assets/51749920/46e6809e-76f3-43d1-9d38-112a5bcdc27c)


> [!important]
> **Question: What are two Databases options Available on Azure?** 
> <br> 1. Azure Database
> <br> 2. Open source Database


> [!important]
> **Question: What are two Azure Databases?** 
> <br> 1. Azure Cosmos DB
> <br> 2. Azure SQL Database 


> [!important]
> **Question: What are two Azure SQL Database deployment options?** 
> <br> 1. SQL Server on Azure VM
> <br> 2. Azure SQL Database
> <br>    - **Single database**: As a single database with its own set of resources managed via a logical SQL server. A single database is like a contained database in SQL Server.
> <br>    - **Elastic pool**: An elastic pool, which is a collection of databases with a shared set of resources managed via a logical server. Single databases can be moved into and out of an elastic pool. Elastic pools provide a cost-effective solution for managing the performance of multiple databases that have variable usage patterns.
> <br> 3. Azure SQL Managed Instance

> [!important]
> **Question: What are two Azure SQL Database pricing model?** 
> <br> 1. vCore-based purchasing model
> <br> 2. DTU-based purchasing model


> [!important]
> **Question: What are other 3rd party/open source Databases on Azure?** 
> <br> 1. Azure Database for PostgreSQL 
> <br> 2. Azure Database for MySQL 
> <br> 3. Azure Database for MariaDB 

> [!important]
> **Question: What relational databases are supported on Azure?** 
> <br> 1. Azure SQL Database
> <br> 2. Azure Database for MySQL 
> <br> 3. Azure Database for MariaDB
> <br> 4. Azure Database for PostgreSQL

> [!important]
> **Question: What *non-relational* databases supported on Azure?** 
> <br> 1. **Azure CosmosDB**: It is a globally distributed, multi-model database service which manages data as a partitioned set of documents. It is a serverless service and scalable.
> <br> 2. **Azure File Storage**: It allows us to create file shares in the cloud, and access them from anywhere with an internet connection.
> <br> 3. **Azure Blob Storage**: This service lets you store massive amounts of unstructured data, or blobs, in the cloud.
> <br> 4. **Azure Table Storage**: In this service, the data for an item is stored as a set of fields, and the item is identified by a unique key. It implements the key-value data store model.


Azure offers a choice of relational and non-relational databases for all your application needs.

## Azure Database 

### Azure Cosmos DB
Azure Cosmos DB is a fully managed NoSQL and relational database for modern app development including AI, digital commerce, Internet of Things, booking management, and other types of solutions. Azure Cosmos DB offers single-digit millisecond response times, automatic and instant scalability, along with guaranteed speed at any scale.

### Azure SQL Database
Azure SQL Database is always running on the latest stable version of the SQL Server database engine and patched OS with 99.99% availability. PaaS capabilities built into Azure SQL Database enable you to focus on the domain-specific database administration and optimization activities that are critical for your business. With Azure SQL Database, you can create a highly available and high-performance data storage layer for the applications and solutions in Azure. SQL Database can be the right choice for a variety of modern cloud applications because it enables you to process both relational data and nonrelational structures, such as graphs, JSON, spatial, and XML.
Azure SQL Database is based on the latest stable version of the Microsoft SQL Server database engine. You can use advanced query processing features, such as high-performance in-memory technologies and intelligent query processing. In fact, the newest capabilities of SQL Server are released first to Azure SQL Database, and then to SQL Server itself. You get the newest SQL Server capabilities with no overhead for patching or upgrading, tested across millions of databases.

#### Azure SQL Database Pricing Models
SQL Database enables you to easily define and scale performance within two different purchasing models: a vCore-based purchasing model and a DTU-based purchasing model. SQL Database is a fully managed service that has built-in high availability, backups, and other common maintenance operations. Microsoft handles all patching and updating of the SQL and operating system code. You don't have to manage the underlying infrastructure.

**vCore-based purchasing model**
The vCore-based purchasing model lets you choose the number of vCores, the amount of memory, and the amount and speed of storage. The vCore-based purchasing model also allows you to use Azure Hybrid Benefit for SQL Server to gain cost savings by leveraging your existing SQL Server licenses.
Service tiers
The vCore-based purchasing model offers three service tiers:
The General Purpose service tier is designed for common workloads. It offers budget-oriented balanced compute and storage options.
The Business Critical service tier is designed for OLTP applications with high transaction rates and low latency I/O requirements. It offers the highest resilience to failures by using several isolated replicas.
The Hyperscale service tier is designed for most business workloads. Hyperscale provides great flexibility and high performance with independently scalable compute and storage resources. It offers higher resilience to failures by allowing configuration of more than one isolated database replica.

**DTU-based purchasing model**
The DTU-based purchasing model offers a blend of compute, memory, and I/O resources in three service tiers, to support light to heavy database workloads. Compute sizes within each tier provide a different mix of these resources, to which you can add additional storage resources.
Service tiers
The DTU-based purchasing model offers two service tiers:
The Standard service tier is designed for common workloads. It offers budget-oriented balanced compute and storage options.
The Premium service tier is designed for OLTP applications with high transaction rates and low latency I/O requirements. It offers the highest resilience to failures by using several isolated replicas.

#### Deployment models
Azure SQL Database provides the following deployment options for a database:
Single database represents a fully managed, isolated database. You might use this option if you have modern cloud applications and microservices that need a single reliable data source. A single database is similar to a contained database in the SQL Server database engine.
Elastic pool is a collection of single databases with a shared set of resources, such as CPU or memory. Single databases can be moved into and out of an elastic pool.

## Open-Source Database

**Azure Database for PostgreSQL**
Azure Database for PostgreSQL - Flexible Server is a relational database service based on the open-source Postgres database engine. It's a fully managed database-as-a-service that can handle mission-critical workloads with predictable performance, security, high availability, and dynamic scalability.

**Azure Database for MySQL**
Azure Database for MySQL - Flexible Server is a relational database service powered by the MySQL community edition. You can use Azure Database for MySQL - Flexible Server to host a MySQL database in Azure. It's a fully managed database as a service offering that can handle mission-critical workloads with predictable performance and dynamic scalability.

**Azure Database for MariaDB**
Azure Database for MariaDB is a relational database service based on the open-source MariaDB Server engine. It's a fully managed database as a service offering that can handle mission-critical workloads with predictable performance and dynamic scalability. Develop applications with Azure Database for MariaDB leveraging the open-source tools and platform of your choice.

**Azure Cache for Redis**
Azure Cache for Redis provides an in-memory data store based on the Redis software. Redis improves the performance and scalability of an application that uses backend data stores heavily. It's able to process large volumes of application requests by keeping frequently accessed data in the server memory, which can be written to and read from quickly. Redis brings a critical low-latency and high-throughput data storage solution to modern applications.




# Azure Monitor
> [!important]
> **Question: What's the difference between Azure Monitor, Log Analytics, and Application Insights??** 
> <br> In September 2018, Microsoft combined Azure Monitor, Log Analytics, and Application Insights into a single service to provide powerful end-to-end monitoring of your applications and the components they rely on. Features in Log Analytics and Application Insights haven't changed, although some features have been rebranded to Azure Monitor to better reflect their new scope. The log data engine and query language of Log Analytics is now referred to as Azure Monitor Logs.

Full observability into your applications, infrastructure, and network. All events that happen in Azure feeds into Azure Monitor. Azure Monitor is a comprehensive monitoring solution for collecting, analysing, and responding to monitoring data from your cloud and on-premises environments. You can use Azure Monitor to maximize the availability and performance of your applications and services. It helps you understand your applications' performance and allows you to manually and programmatically respond to system events.
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/89e9c638-7418-4966-b10d-26787698ba99)

## Resources of Azure Monitoring
Azure Monitor can monitor these types of resources in Azure, other clouds, or on-premises:
- Applications
- Virtual machines
- Guest operating systems
- Containers including Prometheus metrics
- Databases
- Security events in combination with Azure Sentinel
- Networking events and health in combination with Network Watcher
- Custom sources that use the APIs to get data into Azure Monitor
You can also export monitoring data from Azure Monitor into other systems so you can:
- Integrate with other third-party and open-source monitoring and visualization tools
- Integrate with ticketing and other ITSM systems

## Monitoring Data Source
Azure Monitor can collect data from multiple sources.
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/31bcf106-375a-4558-8ac2-434fb4cee05a)


Azure Monitor collects and routes monitoring data using a few different mechanisms depending on the data being routed and the destination. Much like a road system built over time, not all roads lead to all locations. Some are legacy, some new, and some are better to take than others given how Azure Monitor has evolved over time. 
Azure Monitor has a common data platform that consolidates data from a variety of sources. Currently, different sources of data for Azure Monitor use different methods to deliver their data, and each typically require different types of configurations.
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/1fc88215-6b72-496c-8648-d4ab7a5a2870)

### Metrics
Metrics are numerical values that describe an aspect of a system at a particular point in time. Azure Monitor Metrics is a time-series database, optimized for analyzing time-stamped data. Azure Monitor collects metrics at regular intervals. Metrics are identified with a timestamp, a name, a value, and one or more defining labels. They can be aggregated using algorithms, compared to other metrics, and analyzed for trends over time. It supports native Azure Monitor metrics and Prometheus metrics.

### Logs
Logs are recorded system events. Logs can contain different types of data, be structured or free-form text, and they contain a timestamp. Azure Monitor stores structured and unstructured log data of all types in Azure Monitor Logs. You can route data to Log Analytics workspaces for querying and analysis.

**Log Analytics**
Log Analytics is a tool in the Azure portal to edit log queries and interactively analyze their results.

**Logs query language**
Log queries are written by using the Kusto Query Language (KQL). This rich language is designed to be easy to read and author, so you should be able to start writing queries with some basic guidance.
Kusto Query Language (KQL) is a powerful tool to explore your data and discover patterns, identify anomalies and outliers, create statistical modeling, and more. KQL is a simple yet powerful language to query structured, semi-structured, and unstructured data. The language is expressive, easy to read and understand the query intent, and optimized for authoring experiences. Kusto Query Language is optimal for querying telemetry, metrics, and logs with deep support for text search and parsing, time-series operators and functions, analytics and aggregation, geospatial, vector similarity searches, and many other language constructs that provide the most optimal language for data analysis. The query uses schema entities that are organized in a hierarchy similar to SQLs: databases, tables, and columns.

### Distributed traces
Distributed tracing allows you to see the path of a request as it travels through different services and components. Azure Monitor gets distributed trace data from instrumented applications. The trace data is stored in a separate workspace in Azure Monitor Logs.

### Changes
Changes are a series of events in your application and resources. They're tracked and stored when you use the Change Analysis service, which uses Azure Resource Graph as its store. Change Analysis helps you understand which changes, such as deploying updated code, may have caused issues in your systems.

## Azure Monitor Insights
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/d3da37fa-a2fc-45f9-9089-d404603ba4ab)


Some Azure resource providers have curated visualizations that provide a customized monitoring experience and require minimal configuration. Insights are large, scalable, curated visualizations.

**Application Insights**
Application Insights monitors the availability, performance, and usage of your web applications.

**Container Insights**
Container Insights gives you performance visibility into container workloads that are deployed to managed Kubernetes clusters hosted on Azure Kubernetes Service. Container Insights collects container logs and metrics from controllers, nodes, and containers that are available in Kubernetes through the Metrics API. After you enable monitoring from Kubernetes clusters, these metrics and logs are automatically collected for you through a containerized version of the Log Analytics agent for Linux.

**VM Insights**
VM Insights monitors your Azure VMs. It analyses the performance and health of your Windows and Linux VMs and identifies their different processes and interconnected dependencies on external processes. The solution includes support for monitoring performance and application dependencies for VMs hosted on-premises or another cloud provider.

**Network Insights**
Network Insights provides a comprehensive and visual representation through topologies, of health and metrics for all deployed network resources, without requiring any configuration. It also provides access to network monitoring capabilities like Connection Monitor, flow logging for network security groups (NSGs), and Traffic Analytics and other diagnostic features.

## Tools to Visualise Azure Monitor data
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/808412c6-eefd-4182-a5fc-e4518b352665)

Visualizations such as charts and tables are effective tools for summarizing monitoring data and presenting it to different audiences. Azure Monitor has its own features for visualizing monitoring data and uses other Azure services for publishing it to different audiences. Power BI and Grafana are not officially part of the Azure Monitor product, but they're a core integration and part of the Azure Monitor story.

**Azure Monitoring Dashboard**
Azure dashboards allow you to combine different kinds of data into a single pane in the Azure portal. You can optionally share the dashboard with other Azure users. You can add the output of any log query or metrics chart to an Azure dashboard. For example, you could create a dashboard that combines tiles that show a graph of metrics, a table of activity logs, a usage chart from Application Insights, and the output of a log query.

**Workbook**
Workbooks provide a flexible canvas for data analysis and the creation of rich visual reports in the Azure portal. You can use them to query data from multiple data sources. Workbooks can combine and correlate data from multiple data sets in one visualization giving you easy visual representation of your system. Workbooks are interactive and can be shared across teams with data updating in real time. Use workbooks provided with Insights, utilize the library of templates, or create your own.

**Power BI**
Power BI is a business analytics service that provides interactive visualizations across various data sources. It's an effective means of making data available to others within and outside your organization. You can configure Power BI to automatically import log data from Azure Monitor to take advantage of these visualizations.

**Grafana**
Grafana is an open platform that excels in operational dashboards. All versions of Grafana include the Azure Monitor data source plug-in to visualize your Azure Monitor metrics and logs. Azure Managed Grafana also optimizes this experience for Azure-native data stores such as Azure Monitor and Azure Data Explorer. In this way, you can easily connect to any resource in your subscription and view all resulting monitoring data in a familiar Grafana dashboard. It also supports pinning charts from Azure Monitor metrics and logs to Grafana dashboards.
Grafana has popular plug-ins and dashboard templates for non-Microsoft APM tools such as Dynatrace, New Relic, and AppDynamics as well. You can use these resources to visualize Azure platform data alongside other metrics from higher in the stack collected by these other tools. It also has AWS CloudWatch and GCP BigQuery plug-ins for multicloud monitoring in a single pane of glass.

## Tools to Analyse Azure Monitor data
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/6414df22-6b9a-42b0-b5a0-e55f599488c3)


**Metrics explorer**
Use the Azure Monitor metrics explorer user interface in the Azure portal to investigate the health and utilization of your resources. Metrics explorer helps you plot charts, visually correlate trends, and investigate spikes and dips in metric values. Metrics explorer contains features for applying dimensions and filtering, and for customizing charts. These features help you analyze exactly the data you need in a visually intuitive way.

**Log Analytics**
The Log Analytics user interface in the Azure portal helps you query the log data collected by Azure Monitor so that you can quickly retrieve, consolidate, and analyze collected data. After creating test queries, you can then directly analyze the data with Azure Monitor tools, or you can save the queries for use with visualizations or alert rules. Log Analytics workspaces are based on Azure Data Explorer, using a powerful analysis engine and the rich Kusto query language (KQL).Azure Monitor Logs uses a version of the Kusto Query Language suitable for simple log queries, and advanced functionality such as aggregations, joins, and smart analytics. You can get started with KQL quickly and easily. NOTE: The term "Log Analytics" is sometimes used to mean both the Azure Monitor Logs data platform store and the UI that accesses that store. Previous to 2019, the term "Log Analytics" did refer to both. It's still common to find content using that framing in various blogs and documentation on the internet.

**Change Analysis**
Change Analysis is a subscription-level Azure resource provider that checks resource changes in the subscription and provides data for diagnostic tools to help users understand what changes might have caused issues. The Change Analysis user interface in the Azure portal gives you insight into the cause of live site issues, outages, or component failures. Change Analysis uses the Azure Resource Graph to detect various types of changes, from the infrastructure layer through application deployment.


## Response Action tools for Azure Monitor
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/0fb696a9-f550-4684-8bd0-7b482ddd15a1)

An effective monitoring solution proactively responds to critical events, without the need for an individual or team to notice the issue. The response could be a text or email to an administrator, or an automated process that attempts to correct an error condition.

**Artificial Intelligence for IT Operations (AIOps)**
It can improve service quality and reliability by using machine learning to process and automatically act on data you collect from applications, services, and IT resources into Azure Monitor. It automates data-driven tasks, predicts capacity usage, identifies performance issues, and detects anomalies across applications, services, and IT resources. These features simplify IT monitoring and operations without requiring machine learning expertise.

**Azure Monitor Alerts**
It notifies you of critical conditions and can take corrective action. Alert rules can be based on metric or log data.
- Metric alert rules provide near-real-time alerts based on collected metrics.
- Log alerts rules based on logs allow for complex logic across data from multiple sources.
Alert rules use action groups, which can perform actions such as sending email or SMS notifications. Action groups can send notifications using webhooks to trigger external processes or to integrate with your IT service management tools. Action groups, actions, and sets of recipients can be shared across multiple rules.

**Auto scale**
It allows you to dynamically control the number of resources running to handle the load on your application. You can create rules that use Azure Monitor metrics to determine when to automatically add resources when the load increases or remove resources that are sitting idle. You can specify a minimum and maximum number of instances, and the logic for when to increase or decrease resources to save money and to increase performance.

## Azure Monitor Integration for custom solution
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/55cccbca-60df-44a2-bb63-d2bf41b28abe)

Data which is available inside your Azure Monitor can be accesses to create a custom solution. You may need to integrate Azure Monitor with other systems or to build custom solutions that use your monitoring data or take custom actions. These Azure services work with Azure Monitor to provide integration capabilities. Below are only a few of the possible integrations.

**Event Hubs**
Azure Event Hubs is a streaming platform and event ingestion service. It can transform and store data by using any real-time analytics provider or batching/storage adapters. Use Event Hubs to stream Azure Monitor data to partner SIEM and monitoring tools.

**Azure Storage**
Export data to Azure storage for less expensive, long-term archival of monitoring data for auditing or compliance purposes.

**Hosted and Managed Partners**
Many external partners integrate with Azure Monitor. Azure Monitor has partnered with other monitoring providers to provide an Azure-hosted version of their products to make interoperability easier. Examples include Elastic, Datadog, Logz.io, and Dynatrace.

**API**
Multiple APIs are available to read and write metrics and logs to and from Azure Monitor in addition to accessing generated alerts. You can also configure and retrieve alerts. With APIs, you have unlimited possibilities to build custom solutions that integrate with Azure Monitor.

**Azure Logic Apps**
Azure Logic Apps is a service you can use to automate tasks and business processes by using workflows that integrate with different systems and services with little or no code. Activities are available that read and write metrics and logs in Azure Monitor. You can use Logic Apps to customize responses and perform other actions in response to Azure Monitor alerts. You can also perform other more complex actions when the Azure Monitor infrastructure doesn't already supply a built-it method.

**Azure Functions**
Similar to Azure Logic Apps, Azure Functions give you the ability to preprocess and post process monitoring data and perform complex action beyond the scope of typical Azure Monitor alerts. Azure Functions uses code however providing additional flexibility over Logic Apps.

**Azure DevOps and GitHub**
Azure Monitor Application Insights gives you the ability to create Work Item Integration with monitoring data embedding in it. Additional options include release annotations and continuous monitoring.

## Azure Advisor

Azure Advisor offers actionable recommendations to help you optimize your Azure resources for reliability, security, operational excellence, performance, and cost.
Advisor is a personalized cloud consultant that helps you follow best practices to optimize your Azure deployments. It analyses your resource configuration and usage telemetry and then recommends solutions that can help you improve the cost effectiveness, performance, Reliability (formerly called High availability), and security of your Azure resources.


# Containers
As you develop and deploy applications, you quickly run into challenges common to any production-grade system. For instance, you might ask yourself questions like:
- How can I be confident that what works on my machine works in production?
- How can I manage settings between different environments?
- How do I reliably deploy my application?
Some organizations choose to use virtual machines to deal with these problems. However, virtual machines can be costly, sometimes slow, and too large to move around the network.
Instead of using a fully virtualized environment, some developers turn to containers.

**What is a container?**
Think for a moment about goods traveling around in a shipping container. When you see large metal boxes on cargo ships, you notice they're all the same size and shape. These containers make it easy to stack and move goods all around the world, regardless of what’s inside.
Software containers work the same way, but in the digital world. Just like how a shipping container can hold toys, clothes, or electronics, a software container packages up everything an application needs to run. Whether on your computer, in a test environment, or in production a cloud service like Microsoft Azure, a container works the same way in diverse contexts.

**Benefits of using containers**
Containers package your applications in an easy-to-transport unit. Here are a few benefits of using containers:
- **Consistency**: Goods in a shipping container remain safe and unchanged during transport. Similarly, a software container guarantees consistent application behavior among different environments.
- **Flexibility**: Despite the diverse contents of a shipping container, transportation methods remain standardized. Software containers encapsulate different apps and technologies, but are maintained in a standardized fashion.
- **Efficiency**: Just as shipping containers optimize transport by allowing efficient stacking on ships and trucks, software containers optimize the use of computing resources. This optimization allows multiple containers to operate simultaneously on a single server.
- **Simplicity**: Moving shipping containers requires specific, yet standardized tools. Similarly, Azure Container Apps simplifies how you use containers, which allows you focus on app development without worrying about the details of container management.

**Images**
A container image is a static file with executable code that can create a container on a computing system. A container image is immutable meaning it cannot be changed, and can be deployed consistently in any environment. It is a core component of a containerized architecture.
Container images include everything a container needs to run—the container engine such as Docker or CoreOS, system libraries, utilities, configuration settings, and specific workloads that should run on the container. 
Container image has everything that your app needs except OS. The image shares the operating system kernel of the host, so it does not need to include a full operating system.
A container image is composed of layers, added on to a parent image (also known as a base image). Layers make it possible to reuse components and configurations across images. Constructing layers in an optimal manner can help reduce container size and improve performance.
A container image is a ready-to-run software package containing everything needed to run an application: the code and any runtime it requires, application and system libraries, and default values for any essential settings.
Containers are intended to be stateless and immutable: you should not change the code of a container that is already running. If you have a containerized application and want to make changes, the correct process is to build a new image that includes the change, then recreate the container to start from the updated image.

**Azure Container Registry**
Azure Container Registry stores docker images. 
Azure Container Registry allows you to build, store, and manage container images and artifacts in a private registry for all types of container deployments. Use Azure container registries with your existing container development and deployment pipelines. Use Azure Container Registry Tasks to build container images in Azure on-demand, or automate builds triggered by source code updates, updates to a container's base image, or timers.
Developers can push to a container registry as part of a container development workflow. For example, target a container registry from a continuous integration and delivery tool such as Azure Pipelines or Jenkins.
Configure ACR Tasks to automatically rebuild application images when their base images are updated, or automate image builds when your team commits code to a Git repository. Create multi-step tasks to automate building, testing, and patching multiple container images in parallel in the cloud.

# Azure Compute > IaaS > Azure Virtual Machine
Azure virtual machines are one of several types of on-demand, scalable computing resources that Azure offers. Typically, you choose a virtual machine when you need more control over the computing environment than the other choices offer.

**Parts of a VM**

When you create a virtual machine, you're also creating resources that support the virtual machine. These resources come with their own costs that should be considered.

**Virtual network**
For giving your virtual machine the ability to communicate with other resources

**A virtual Network Interface Card (NIC)**	For connecting to the virtual network

**A private IP address and sometimes a public IP address.**	For communication and data exchange on your network and with external networks

**Network security group (NSG)**	For managing the network traffic too and from your VM. For example, you might need to open port 22 for SSH access, but you might want to block traffic to port 80. Blocking and allowing port access is done through the NSG.

**OS Disk and possibly separate disks for data.**	It's a best practice to keep your data on a separate disk from your operating system, in case you ever have a VM fail, you can simply detach the data disk, and attach it to a new VM.

**In some cases, a license for the OS**	For providing your virtual machine runs to run the OS

## VM Availability
There are multiple options to manage the availability of your virtual machines in Azure.
- Availability Zones are physically separated zones within an Azure region. Availability zones guarantee virtual machine connectivity to at least one instance at least 99.99% of the time when you've two or more instances deployed across two or more Availability Zones in the same Azure region.
- Scaling
  - Vertical - Adding more CPU to existing machine.
  - Horizontal - Adding more VMs on demand using VMSS
    - Virtual Machine Scale Sets let you create and manage a group of load balanced virtual machines. The number of virtual machine instances can automatically increase or decrease in response to demand or a defined schedule. Scale sets provide high availability to your applications, and allow you to centrally manage, configure, and update many virtual machines. Virtual machines in a scale set can also be deployed into multiple availability zones, a single availability zone, or regionally.

## Connecting to VM

**RDP**
It’s your usual way to connect to VM.

**Bastion**
Azure Bastion is a fully managed PaaS service that you provision to securely connect to virtual machines via private IP address. It provides secure and seamless RDP/SSH connectivity to your virtual machines directly over TLS from the Azure portal, or via the native SSH or RDP client already installed on your local computer. When you connect via Azure Bastion, your virtual machines don't need a public IP address, agent, or special client software.
Azure Bastion is a service that you can deploy to let you connect to a virtual machine using your browser and the Azure portal, or via the native SSH or RDP client already installed on your local computer. The Azure Bastion service is a fully platform-managed PaaS service that you deploy inside your virtual network. It provides secure and seamless RDP/SSH connectivity to your virtual machines directly from the Azure portal over TLS. When you connect via Azure Bastion, your virtual machines don't need a public IP address, agent, or special client software.

**SSH**
When connecting to a Windows virtual machine using SSH, you can use both username/password and SSH keys for authentication.


# Azure Compute > PaaS > Azure App Service
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/da85a578-cc76-4656-8a3b-ec4fd0358207)

> [!important]
> **Question: What is an Azure App Service?** 
> <br> Azure App Service enables you to build and host web apps, mobile back ends, and RESTful APIs in the programming language of your choice without managing infrastructure.


> [!important]
> **Question: What are App Service Types?** 
> 1. Web Apps
> 2. API Apps
> 3. Logic Apps
> 4. Mobile Apps
> 5. Function Apps

> [!important]
> **Question: What is a Azure App Service Plan?** 
> <br> App service plan is a web hosting plan. You can add multiple web apps into a single web service plan. It defines a set of compute resources for a web app to run.


> [!important]
> **Question: What are App Service Deployment Source?** 
> 1. GitHub
> 2. BitBucket
> 3. Azure Repos
> 4. Azure Pipelines or Jenkins etc
> 5. FTP and WebDeploy

> [!important]
> **Question: What are App Service Scaling?** 
> 1. Scale Up/Down: Increase/decrease CPU, memory, disk space, and extra features like dedicated virtual machines (VMs)
> 2. Scale Out/In: Increase/decrease the number of VM instances that run your app.

Azure App Service enables you to build and host web apps, mobile back ends, and RESTful APIs in the programming language of your choice without managing infrastructure. It offers auto-scaling and high availability, supports both Windows and Linux, and enables automated deployments from GitHub, Azure DevOps, or any Git repo.
Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends. You can develop in your favorite language, be it .NET, .NET Core, Java, Node.js, PHP, and Python. Applications run and scale with ease on both Windows and Linux-based environments.
App Service adds the power of Microsoft Azure to your application, such as security, load balancing, autoscaling, and automated management. Additionally, you can take advantage of its DevOps capabilities, such as continuous deployment from Azure DevOps, GitHub, Docker Hub, and other sources, package management, staging environments, custom domain, and TLS/SSL certificates.
With App Service, you pay for the Azure compute resources you use. The compute resources you use are determined by the App Service plan that you run your apps on. For more information, see Azure App Service plans overview.
## App Service Types

**Web App**
Web App is one of the most widely used Azure services. You can use this to host your web applications or APIs. A Web App is basically an abstraction of a web server, like Internet Information Services (IIS) or Tomcat, that you use to host HTTP-driven applications. Web App can host applications that are written in .NET, Node.js, PHP, Java, or Python, and there are extensions that you can use to run even more languages.
Web App for Containers
Web App for Containers helps you easily deploy and run containerized web apps at scale. Just pull container images from Docker Hub or a private Azure Container Registry, and Web App for Containers will deploy the containerized app with your preferred dependencies to production in seconds. The platform automatically takes care of OS patching, capacity provisioning, and load balancing.

**Mobile App**
Mobile App provides a backend for your mobile applications. You host an API in Mobile App that your mobile applications connect with through the cross-platform client SDK. This is available for iOS, Android, Windows, and Xamarin for iOS and Android and Xamarin Forms. Mobile App provides unique features like Offline Sync and Push Notifications that help you to create a modern, performant, and secure mobile experience. You can write your Mobile App backend in .NET or Node.js.

**API Apps (Web services)**
It’s the new version of web services. Create and deploy RESTful APIs in seconds, as powerful as you need them. Leverage your existing tools to create and deploy RESTful APIs without the hassle of managing infrastructure. Microsoft Azure App Service API Apps offers secure and flexible development, deployment, and scaling options for any sized RESTful API application.

**Web Job**
Web Job is a dependent on a web app so in order to create a web job you must have a web app. Web Job is a code behind task which activates on schedule or on at particular event to do a particular task for an associated web app. This helps web app to only process the necessary task to respond quickly to the user and leave the long processes and less important task for the web job. For example, azif user uploads an image and you need to shrink the image size which could take a bit longer so can just offer user to upload image on web app and response quickly once the image uploaded and then schedule a web job or active it thought a queue message to shrink the image size.

## App Service plan
App service plan is a web hosting plan. You can add multiple web apps into a single web service plan. It defines a set of compute resources for a web app to run. In App Service, an app runs in an App Service plan. An App Service plan defines a set of compute resources for a web app to run. It also defines the cost for the app service. It’s actually the financial model of the web apps.
An app service always runs in an App Service plan. An App Service plan defines a set of compute resources for a web app to run.
When you create an App Service plan in a certain region (for example, West Europe), a set of compute resources is created for that plan in that region. Whatever apps you put into this App Service plan run on these compute resources as defined by your App Service plan. Each App Service plan defines:
- Operating System (Windows, Linux)
- Region (West US, East US, and so on)
- Number of VM instances
- Size of VM instances (Small, Medium, Large)
- Pricing tier (Free, Shared, Basic, Standard, Premium, PremiumV2, PremiumV3, Isolated, IsolatedV2)
The pricing tier of an App Service plan determines what App Service features you get and how much you pay for the plan. The pricing tiers available to your App Service plan depend on the operating system selected at creation time. There are the following categories of pricing tiers:
- Shared compute: Free and Shared, the two base tiers, runs an app on the same Azure VM as other App Service apps, including apps of other customers. These tiers allocate CPU quotas to each app that runs on the shared resources, and the resources cannot scale out. These tiers are intended to be used only for development and testing purposes.
- Dedicated compute: The Basic, Standard, Premium, PremiumV2, and PremiumV3 tiers run apps on dedicated Azure VMs. Only apps in the same App Service plan share the same compute resources. The higher the tier, the more VM instances are available to you for scale-out.
- Isolated: The Isolated and IsolatedV2 tiers run dedicated Azure VMs on dedicated Azure Virtual Networks. It provides network isolation on top of compute isolation to your apps. It provides the maximum scale-out capabilities.
Each tier also provides a specific subset of App Service features. These features include custom domains and TLS/SSL certificates, autoscaling, deployment slots, backups, Traffic Manager integration, and more. The higher the tier, the more features are available. To find out which features are supported in each pricing tier.

## App Service Deployment 
Every development team has unique requirements that can make implementing an efficient deployment pipeline difficult on any cloud service. This article introduces the three main components of deploying to App Service: deployment sources, build pipelines, and deployment mechanisms. This article also covers some best practices and tips for specific language stacks.

### Deployment Components
**Deployment Source**
A deployment source is the location of your application code. For production apps, the deployment source is usually a repository hosted by version control software such as
- GitHub
- BitBucket
- Azure Repos.
For development and test scenarios, the deployment source may be a project on your local machine.
**Build Pipeline**
Once you decide on a deployment source, your next step is to choose a build pipeline. A build pipeline reads your source code from the deployment source and executes a series of steps (such as compiling code, minifying HTML and JavaScript, running tests, and packaging components) to get the application in a runnable state. The specific commands executed by the build pipeline depend on your language stack. These operations can be executed on a build server such as Azure Pipelines, or executed locally.
**Deployment Mechanism**
The deployment mechanism is the action used to put your built application into the /home/site/wwwroot directory of your web app. The /wwwroot directory is a mounted storage location shared by all instances of your web app. When the deployment mechanism puts your application in this directory, your instances receive a notification to sync the new files. App Service supports the following deployment mechanisms:
- Deployment tools such as Azure Pipelines, Jenkins, and editor plugins use one of these deployment mechanisms.
- Kudu endpoints: Kudu is the open-source developer productivity tool that runs as a separate process in Windows App Service, and as a second container in Linux App Service. Kudu handles continuous deployments and provides HTTP endpoints for deployment, such as zipdeploy/.
- FTP and WebDeploy: Using your site or user credentials, you can upload files via FTP or WebDeploy. These mechanisms don't go through Kudu.

### Use deployment slots
Whenever possible, use deployment slots when deploying a new production build. When using a Standard App Service Plan tier or better, you can deploy your app to a staging environment, validate your changes, and do smoke tests. When you're ready, you can swap your staging and production slots. The swap operation warms up the necessary worker instances to match your production scale, thus eliminating downtime.
**Continuously deploy code**
If your project has designated branches for testing, QA, and staging, then each of those branches should be continuously deployed to a staging slot. (This is known as the Gitflow design.) This allows your stakeholders to easily assess and test the deployed branch.
Continuous deployment should never be enabled for your production slot. Instead, your production branch (often main) should be deployed onto a nonproduction slot. When you're ready to release the base branch, swap it into the production slot. Swapping into production—instead of deploying to production—prevents downtime and allows you to roll back the changes by swapping again.
 
**Continuously deploy containers**
For custom containers from Docker or other container registries, deploy the image into a staging slot and swap into production to prevent downtime. The automation is more complex than code deployment because you must push the image to a container registry and update the image tag on the webapp.
For each branch you want to deploy to a slot, set up automation to do the following on each commit to the branch.
1.	Build and tag the image. As part of the build pipeline, tag the image with the git commit ID, timestamp, or other identifiable information. It’s best not to use the default “latest” tag. Otherwise, it’s difficult to trace back what code is currently deployed, which makes debugging far more difficult.
2.	Push the tagged image. Once the image is built and tagged, the pipeline pushes the image to our container registry. In the next step, the deployment slot will pull the tagged image from the container registry.
3.	Update the deployment slot with the new image tag. When this property is updated, the site will automatically restart and pull the new container image.
 
**Use Azure DevOps**
App Service has built-in continuous delivery for containers through the Deployment Center. Navigate to your app in the Azure portal and select Deployment Center under Deployment. Follow the instructions to select your repository and branch. This will configure a DevOps build and release pipeline to automatically build, tag, and deploy your container when new commits are pushed to your selected branch.

**Use GitHub Actions**
You can also automate your container deployment with GitHub Actions. The workflow file below will build and tag the container with the commit ID, push it to a container registry, and update the specified web app with the new image tag.

**Use other automation providers**
The steps listed earlier apply to other automation utilities such as CircleCI or Travis CI. However, you need to use the Azure CLI to update the deployment slots with new image tags in the final step.

### Environment variables and App settings in Azure App Service
In Azure App Service, certain settings are available to the deployment or runtime environment as environment variables. Some of these settings can be customized when you set them manually as app settings. This reference shows the variables you can use or customize.
In App Service, app settings are variables passed as environment variables to the application code. For Linux apps and custom containers, App Service passes app settings to the container using the --env flag to set the environment variable in the container. In either case, they're injected into your app environment at app startup. When you add, remove, or edit app settings, App Service triggers an app restart.
For ASP.NET and ASP.NET Core developers, setting app settings in App Service are like setting them in <appSettings> in Web.config or appsettings.json, but the values in App Service override the ones in Web.config or appsettings.json. You can keep development settings (for example, local MySQL password) in Web.config or appsettings.json and production secrets (for example, Azure MySQL database password) safely in App Service. The same code uses your development settings when you debug locally, and it uses your production secrets when deployed to Azure.

### Azure App Service Scaling & Performance
There are two workflows for scaling, scale up and scale out.
**Add CDN**
You can also add CDN to web app to provide fast, reliable, and secure access between your users and your applications’ static and dynamic web content across the globe.

**Scale Up/Down**
Get more CPU, memory, disk space, and extra features like dedicated virtual machines (VMs), custom domains and certificates, staging slots, autoscaling, and more. You scale up by changing the pricing tier of the App Service plan that your app belongs to.

**Scale Out/In**
Increase the number of VM instances that run your app. You can scale out to as many as 30 instances, depending on your pricing tier. App Service Environments in Isolated tier further increases your scale-out count to 100 instances. For more information about scaling out, see Scale instance count manually or automatically. There, you find out how to use autoscaling, which is to scale instance count automatically based on predefined rules and schedules.
**Scale Out Methods**
- Manual: You manually scale out the app service plan. 
- Automatic: Automatic scaling is a new scale out option that automatically handles scaling decisions for your web apps and App Service Plans.
- Rule based: Define your own rules when to scale out the app service plan, for example if CPU reaches 75%.


## Azure App Service Backup & Restore
In Azure App Service, you can easily restore app backups. You can also make on-demand custom backups or configure scheduled custom backups. You can restore a backup by overwriting an existing app by restoring to a new app or slot.
**Azure App Service Backup Types**
There are two types of backups in App Service.
- Automatic backups made for your app regularly as long as it's in a supported pricing tier. 
- Custom backups require initial configuration, and can be made on-demand or on a schedule.

## Azure App Service monitoring
Azure App Service provides several monitoring options for monitoring resources for availability, performance, and operation. Options such as 
- Diagnostic Settings
- Application Insights
- Log stream
- Metrics
- Quotas and alerts
- Activity logs.




# Azure Compute > Containers > IaaS > Azure Container Instance (ACI)
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/d4d9948b-6ee7-4be2-a709-7fe7eaa98e12)

Run Docker containers on-demand in a managed, serverless Azure environment. Azure Container Instances is a solution for any scenario that can operate in isolated containers, without orchestration. Run event-driven applications, quickly deploy from your container development pipelines, and run data processing and build jobs.

Azure Container Instance is a serverless service. Azure Container Instances is a great solution for any scenario that can operate in isolated containers, including simple applications, task automation, and build jobs.
Use Azure Container Instances to run serverless Docker containers in Azure with simplicity and speed. Deploy an application to a container instance on-demand when you don't need a full container orchestration platform like Azure Kubernetes Service.

**Fast startup times**
Containers offer significant startup benefits over virtual machines (VMs). Azure Container Instances can start containers in Azure in seconds, without the need to provision and manage VMs.

**Container access**
Azure Container Instances enables exposing your container groups directly to the internet with an IP address and a fully qualified domain name (FQDN). When you create a container instance, you can specify a custom DNS name label so your application is reachable at customlabel.azureregion.azurecontainer.io.

Azure Container Instances also supports executing a command in a running container by providing an interactive shell to help with application development and troubleshooting. Access takes places over HTTPS, using TLS to secure client connections.

**Container groups**
A container group is a collection of containers that get scheduled on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. It's similar in concept to a pod in Kubernetes.

**Custom sizes**
Containers are typically optimized to run just a single application, but the exact needs of those applications can differ greatly. Azure Container Instances provides optimum utilization by allowing exact specifications of CPU cores and memory. You pay based on what you need and get billed by the second, so you can fine-tune your spending based on actual need.

**Persistent storage**
To retrieve and persist state with Azure Container Instances, we offer direct mounting of Azure Files shares backed by Azure Storage.

**Linux and Windows containers**
Azure Container Instances can schedule both Windows and Linux containers with the same API. You can specify your OS type preference when you create your container groups.

**Virtual network deployment**
Azure Container Instances enables deployment of container instances into an Azure virtual network. When deployed into a subnet within your virtual network, container instances can communicate securely with other resources in the virtual network, including those that are on premises (through VPN gateway or ExpressRoute).

# Azure Compute > Containers > PaaS > Azure Container App
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/9dec63c5-5ba7-45cb-8509-36f18977a1a2)

> [!important]
> **Question: What is a Azure Container App?** 
> <br> Azure Container Apps is a serverless platform that allows you to maintain less infrastructure and save costs while running containerized applications. Instead of worrying about server configuration, container orchestration, and deployment details. 

Build and deploy fully managed, cloud- native apps and microservices using serverless containers. Azure Container Apps is a serverless platform that handles scaling, security, and infrastructure management for you - all while reducing costs. Once freed from server-related concerns, you're able to spend your time focusing on your application code.
Container Apps make it easy to manage:
1.	Automatic scaling: As requests for your applications fluctuate, Container Apps keeps your systems running even during seasons of high demand. Container Apps meets the demand for your app at any level by automatically creating new copies (called replicas) of your container. As demand falls, the runtime removes unneeded replicas on your behalf.
2.	Security: Application security is enforced throughout many layers. From authentication and authorization to network-level security, Container Apps allows you to be explicit about the users and requests allowed into your system.
3.	Monitoring: Easily monitor your container app's health using observability tools in Container Apps.
4.	Deployment flexibility: You can deploy from GitHub, Azure DevOps, or from your local machine.
5.	Changes: As your containers evolve, Container Apps catalogues changes as revisions to your containers. If you're experiencing a problem with a container, you can easily roll back to an older version.
Azure Container Apps is a serverless platform that allows you to maintain less infrastructure and save costs while running containerized applications. Instead of worrying about server configuration, container orchestration, and deployment details, Container Apps provides all the up-to-date server resources required to keep your applications stable and secure.
Common uses of Azure Container Apps include:
- Deploying API endpoints
- Hosting background processing jobs
- Handling event-driven processing
- Running microservices
Additionally, applications built on Azure Container Apps can dynamically scale based on the following characteristics:
- HTTP traffic
- Event-driven processing
- CPU or memory load

# Azure Messaging Services
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/686213e4-dfb6-4c91-9919-82be98bfa8d7)

Messaging services on Azure provide the interconnectivity between components and applications that are written in different languages and hosted in the same cloud, multiple clouds, or on-premises. Use message queues or topics to send messages without concerns of consumer availability and to help balance varying workload throughput.

## Events vs. messages
**Event**

An event is a lightweight notification of a condition or a state change. The publisher of the event has no expectation about how the event is handled.

**Message**

A message is raw data produced by a service to be consumed or stored elsewhere. The message contains the data that triggered the message pipeline. The publisher of the message has an expectation about how the consumer handles the message. A contract exists between the two sides. For example, the publisher sends a message with the raw data, and expects the consumer to create a file from that data and send a response when the work is done.

## Azure Event Grid
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/48f19fec-edc8-42d6-a579-88fd87eb8eb5)

Simplify your event-based apps with Event Grid, a single service for managing routing of all events from any source to any destination. Designed for high availability, consistent performance, and dynamic scale, Event Grid lets you focus on your app logic rather than infrastructure.
Event Grid connects data sources and event handlers. For example, use Event Grid to instantly trigger a serverless function to run image analysis each time a new photo is added to a blob storage container.

Azure Event Grid is a highly scalable, fully managed Pub Sub message distribution service that offers flexible message consumption patterns using the MQTT and HTTP protocols. With Azure Event Grid, you can build data pipelines with device data, integrate applications, and build event-driven serverless architectures. Event Grid enables clients to publish and subscribe to messages over the MQTT v3.1.1 and v5.0 protocols to support Internet of Things (IoT) solutions. Through HTTP, Event Grid enables you to build event-driven solutions where a publisher service announces its system state changes (events) to subscriber applications. Event Grid can be configured to send events to subscribers (push delivery) or subscribers can connect to Event Grid to read events (pull delivery). Event Grid supports CloudEvents 1.0 specification to provide interoperability across systems.
Azure Event Grid is used at different stages of data pipelines to achieve a diverse set of integration goals.

MQTT messaging. IoT devices and applications can communicate with each other over MQTT. Event Grid can also be used to route MQTT messages to Azure services or custom endpoints for further data analysis, visualization, or storage. This integration with Azure services enables you to build data pipelines that start with data ingestion from your IoT devices.

Data distribution using push and pull delivery modes. At any point in a data pipeline, HTTP applications can consume messages using push or pull APIs. The source of the data may include MQTT clients’ data, but also includes the following data sources that send their events over HTTP:
- Azure services
- Your custom applications
- External partner (SaaS) systems
When using push delivery, Event Grid can send data to destinations that include your own application webhooks and Azure services.

## Azure Event Hubs
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/ea4a9c74-4044-452c-9be3-262972a50e1f)

Azure Event Hubs is a cloud native data streaming service that can stream millions of events per second, with low latency, from any source to any destination. Event Hubs is compatible with Apache Kafka, and it enables you to run existing Kafka workloads without any code changes.
Using Event Hubs to ingest and store streaming data, businesses can harness the power of streaming data to gain valuable insights, drive real-time analytics, and respond to events as they happen, enhancing overall efficiency and customer experience.


## Azure Service Bus
Reliable cloud messaging as a service (MaaS) and simple hybrid integration. Azure Service Bus supports reliable message queuing and durable publish/subscribe messaging. The messaging entities that form the core of the messaging capabilities in Service Bus are queues, topics and subscriptions.

### Service Bus Message Types

**Azure Messaging Queue (NOT A AZURE STORAGE QUEUE)**
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/2b135f89-dea7-46ca-b8d1-7544c01fd8c5)

Queues offer First In, First Out (FIFO) message delivery to one or more competing consumers. That is, receivers typically receive and process messages in the order in which they were added to the queue. And, only one message consumer receives and processes each message.		
A key benefit of using queues is to achieve temporal decoupling of application components. In other words, the producers (senders) and consumers (receivers) don't have to send and receive messages at the same time, because messages are stored durably in the queue. Furthermore, the producer doesn't have to wait for a reply from the consumer to continue to process and send messages.	
 
**Topics and subscriptions**
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/0ff4694b-e22f-40d5-a555-37c043f99988)

Topics and subscriptions provide a one-to-many form of communication in a publish and subscribe pattern. It's useful for scaling to large numbers of recipients. Each published message is made available to each subscription registered with the topic. Publisher sends a message to a topic and one or more subscribers receive a copy of the message.
 
 ### Service Bus Receive Modes

You can specify two different modes in which consumers can receive messages from Service Bus.

**Receive and delete.**

In this mode, when Service Bus receives the request from the consumer, it marks the message as being consumed and returns it to the consumer application. This mode is the simplest model. It works best for scenarios in which the application can tolerate not processing a message if a failure occurs. To understand this scenario, consider a scenario in which the consumer issues the receive request and then crashes before processing it. As Service Bus marks the message as consumed, the application begins consuming messages upon restart. It will miss the message that it consumed before the crash. This process is often called at-most once processing.


**Peek lock.**

In this mode, the receive operation becomes two-stage, which makes it possible to support applications that can't tolerate missing messages.
Finds the next message to be consumed, locks it to prevent other consumers from receiving it, and then, return the message to the application.
After the application finishes processing the message, it requests the Service Bus service to complete the second stage of the receive process. Then, the service marks the message as consumed. 
If the application is unable to process the message for some reason, it can request the Service Bus service to abandon the message. Service Bus unlocks the message and makes it available to be received again, either by the same consumer or by another competing consumer. Secondly, there's a timeout associated with the lock. If the application fails to process the message before the lock timeout expires, Service Bus unlocks the message and makes it available to be received again.
If the application crashes after it processes the message, but before it requests the Service Bus service to complete the message, Service Bus redelivers the message to the application when it restarts. This process is often called at-least once processing. That is, each message is processed at least once. However, in certain situations the same message might be redelivered. If your scenario can't tolerate duplicate processing, add extra logic in your application to detect duplicates. For more information, see Duplicate detection, which is known as exactly once processing.

## Azure Relay
The Azure Relay service enables you to securely expose services that run in your corporate network to the public cloud. You can do so without opening a port on your firewall, or making intrusive changes to your corporate network infrastructure.
The relay service supports the following scenarios between on-premises services and applications running in the cloud or in another on-premises environment.
- Traditional one-way, request/response, and peer-to-peer communication
- Event distribution at internet-scope to enable publish/subscribe scenarios
- Bi-directional and unbuffered socket communication across network boundaries
Azure Relay differs from network-level integration technologies such as VPN. An Azure relay can be scoped to a single application endpoint on a single machine. The VPN technology is far more intrusive, as it relies on altering the network environment.

## Queue storage (Storage Account)
An Azure Storage Account Queue can also be used as Messaging Service. (see storage queue session)

## Notification Hubs
Azure Notification Hubs provide an easy-to-use and scaled-out push engine that enables you to send push notifications to any platform (iOS, Android, Windows, etc.) from any back-end (cloud or on-premises). Notification Hubs works great for both enterprise and consumer scenarios. Here are a few example scenarios:
- Send breaking news notifications to millions with low latency.
- Send location-based coupons to interested user segments.
- Send event-related notifications to users or groups for media/sports/finance/gaming applications.
- Push promotional contents to applications to engage and market to customers.
- Notify users of enterprise events such as new messages and work items.
- Send codes for multi-factor authentication.
Notification Hubs eliminates all complexities associated with sending push notifications on your own from your app backend. Its multi-platform, scaled-out push notification infrastructure reduces push-related coding and simplifies your backend. With Notification Hubs, devices are merely responsible for registering their PNS handles with a hub, while the backend sends messages to users or interest groups

## Azure IoT Hub
Enable bi-directional communication between IoT devices and Azure. Enable highly secure and reliable communication between your Internet of Things (IoT) application and the devices it manages. Azure IoT Hub provides a cloud-hosted solution back end to connect virtually any device. Extend your solution from the cloud to the edge with per-device authentication, built-in device management, and scaled provisioning.
