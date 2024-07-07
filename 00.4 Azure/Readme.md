
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
  - 
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

