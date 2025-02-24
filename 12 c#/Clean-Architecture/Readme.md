# Clean Architecture
![image](https://github.com/user-attachments/assets/25532bef-a654-43e8-8a9b-834f16f140c4)

## Domain 
- contains Entity and Business logic that can be calculated by hand. It includes entities, value objects, domain services, and domain events.

## Application
Contains Application logic - deals with request and it's validity. Contains the application layer, which implements the use cases of the system. It includes commands, queries, handlers, and DTOs.

Depends on:
- Domain

## Infrastructure
Contains the infrastructure layer, which implements the technical details of the system. It includes database access, logging, configuration, and external services.

Depends on:
- Domain
- Application 


> [!TIP]
> - No one reference to Presentation project.
> - Presentation reference to everything.
> - Everyone reference to Domain.

## Presentation (API/WebUI)
- Intract with the user through a UI or through API for other services

Depends on:
- Domian
- Infrastructure
- Application

# Project: 12-TodoApi-CleanArchitecture-MVC-AzureDB-Docker-Kubernetes
```
Source original https://github.com/learnsmartcoding/CleanArchitecture-ToDoApp-DotNet8-WebApi/tree/main

mkdir 12-TodoApi-CleanArchitecture-MVC-AzureDB-Docker-Kubernetes
cd 12-TodoApi-CleanArchitecture-MVC-AzureDB-Docker-Kubernetes

# Add solution and must have clean architecture projects
dotnet new sln -n Todo-CleanArchitecure
dotnet new webapi --use-controllers -o Todo.Presentation.API
dotnet new classlib -o Todo.Domain
dotnet new classlib -o Todo.Application
dotnet new classlib -o Todo.Infrastructure

# Add projects to one solution
dotnet sln Todo-CleanArchitecure.sln add .\Todo.Presentation.API\Todo.Presentation.API.csproj
dotnet sln Todo-CleanArchitecure.sln add .\Todo.Domain\Todo.Domain.csproj
dotnet sln Todo-CleanArchitecure.sln add .\Todo.Application\Todo.Application.csproj
dotnet sln Todo-CleanArchitecure.sln add .\Todo.Infrastructure\Todo.Infrastructure.csproj

# Create Test folder and create test projects (using Class Libarary) in that folder
dotnet new classlib -o .\Tests\Todo.Presentation.API.Test
dotnet new classlib -o .\Tests\Todo.Infrastructure.Test
dotnet new classlib -o .\Tests\Todo.Application.Test

# References
## Application Project
- Domain

## Infrastructure Poject
- Domain
- Application

## Presentation.API
- Domain
- Infrastructure
- Application


## Install EF core package in Infrastructure
cd todo.infrastructure
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.InMemory
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

## Install Scalar in Presentation
cd Todo.Presentation.API
dotnet add package Scalar.AspNetCore



## In Domain project create Entities folder

# In Entities Folder create Poco class that will be mapped to database as code first
.\Todo.Domain\Entities\ToDoItem.cs
.\Todo.Domain\Entities\ToDoList.cs
.\Todo.Domain\Entities\User.cs

# In Domain create Enum flolder
Create .\Todo.Domain\Enum\PriorityLevel.cs


## Application - Contain logic and interfaces
Create Interface - These will be implementes in other places
.\Todo.Application\Interfaces\IToDoItemRepository.cs
.\Todo.Application\Interfaces\IToDoItemService.cs
.\Todo.Application\Interfaces\IToDoListRepository.cs
.\Todo.Application\Interfaces\IToDoListService.cs
.\Todo.Application\Interfaces\IUserRepository.cs
.\Todo.Application\Interfaces\IUserService.cs

```

