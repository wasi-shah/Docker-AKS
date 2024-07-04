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

<hr style="border:20px solid blue !important">

# Azure Storage
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
> <br> **1. Standard general-purpose v2:**  [ available with Blob Storage (including Data Lake Storage1), Queue Storage, Table Storage, and Azure Files]
> <br> **2. Premium block blobs:**  [ available with Blob Storage (including Data Lake Storage1)]
> <br> **3. Premium file shares:**  [Available with Azure Files]
> <br> **4. Premium page blobs:**  [Available with Page blobs only]


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
Max size 8 TB
Page blob are optimized for random read and write operations. These are perfect for storing a VHD. 
#### Block Blobs
Max size 190 TB
Block blobs are optimized for efficiently uploading large amounts of data. These are perfect for storing large video files that don’t change often.
### Azure Files
File Storage (Max size 100TB).
You can use Azure File Storage as a drive from which to share files. It uses the Server Message Block (SMB) protocol, which means that you can use it with Windows and Linux, and you can access it from the cloud or from on-premises systems. Like the other Azure Storage types, File Storage is scalable and inexpensive. Managed file shares for cloud or on-premises deployments.
### Azure Queues
•	Maximum queue size 500 TB
•	Maximum message size 64 KB
Azure Queue Storage is an unusual type of storage in that it is used to store small messages of data, but its main purpose is to serve as a queue. You put messages on the queue and other processes pick it up. This pattern decouples the message sender from the message processor and results in performance and reliability benefits. Azure Queue Storage is based on the Microsoft Message Queueing that you can find in previous versions of Windows.
Azure Queue Storage is a service for storing large numbers of messages. You access messages from anywhere in the world via authenticated calls using HTTP or HTTPS. A queue message can be up to 64 KB in size. A queue may contain millions of messages, up to the total capacity limit of a storage account. Queues are commonly used to create a backlog of work to process asynchronously.
A messaging store for reliable messaging between application components.
### Azure Tables
•	Table has a 5TB storage limit
•	1 MB of data per entry (per row)
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
