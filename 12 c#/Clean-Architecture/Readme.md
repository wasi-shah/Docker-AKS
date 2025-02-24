# Clean Architecture
## Domain 
- contains Entity and Business logic that can be calculated by hand

## Application
- contains Application logic - deals with request and it's validity

Depends on:
- Domain

## Infrastructure
- contains connection to database and other resources

Depends on:
- Domain
- Application 

## Presentation (API/WebUI)
- Intract with the user through a UI or through API for other services

Depends on:
- Domian
- Infra
- Application


