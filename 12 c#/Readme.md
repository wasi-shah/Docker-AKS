# c#
## SOLID Principle
1. **S: Single Responsibility Principle (SRP):** A class should have one, and only one, reason to exists or change.
2. **O: Open-Closed Principle (OCP):** Classes, modules, and functions should be open for extension but closed for modification.
3. **L: Liskov Substitution Principle (LSP):** Every child class or derived class should be replaceable with their parent or base class without causing issues
4. **I: Interface Segregation Principle (ISP):** Interface should have one responsibility. Better to have several specific interfaces rather than one general-purpose interface.
5. **D: Dependency Inversion Principle (DIP):** Write code that depends upon abstractions rather than upon concrete details. “High-level modules should not depend on low-level modules.

## What are Delegates?
A: Delegate is a pointer to  a method.
Delegates Types:
1.Func – return value
2.Action – do not return value
3.Predicate – Returns Boolean

## LINQ Language Integrated Query:
A: Allow to query a database or array without SQL.
1. LINQ allows you to perform filtering, ordering, and grouping operations on data sources with a minimum of code.
2. Allows query with filters in memory, XML, JSON, or database objects like SQL query and returns the results.

### Linq Syntax:
You can search any collection using

1.Query Syntax : Query syntax is similar to SQL (Structured Query Language) for the database.
```
var result = from s in stringList
            where s.Contains("Tutorials") 
            select s;
```

2.Method Syntax : Uses Lambda expression
```
var result = stringList.Where(s => s.Contains("Tutorials"));

```

```
// Data source.
int[] scores = [90, 71, 82, 93, 75, 82];

// Query Expression.
IEnumerable<int> scoreQuery = //query variable
    from score in scores //required
    where score > 80 // optional
    orderby score descending // optional
    select score; //must end with select or group

// Execute the query to produce the results
foreach (var testScore in scoreQuery)
{
    Console.WriteLine(testScore);
}


//Method Syntax 
var testScores2 = scores
    .Where(s => s > 80)
    .OrderByDescending(s => s);

foreach (var testScore in testScores2)
{
    Console.WriteLine(testScore);
}

// Output: 93 90 82 82 

```

### LAMBDA:
A lambda expression can also be seen as an anonymous function. A function that doesn’t have a name and doesn’t belong to any class. 
The lambda expression is a shorter way of representing anonymous method using some special syntax.
* With lambda you can write inline function and call them.
* Lambda expressions is a way of defining anonymous functions.
* A lambda expression is a short block of code which takes in parameters and returns a value. 
* To create a lambda expression, you specify input parameters (if any) on the left side of the lambda operator and an expression or a statement block on the other side.
* Basic Syntax
  
( one input-parameter) => expression
```
    var result = (int x) => x * x;
Console.WriteLine(result(5)); // Output: 25
```
(two input-parameters) => expression
```
            var result1= (int x, int y) => x+y;
        Console.WriteLine(result1(5,3)); // Output: 8
```
(input-parameters) => { <sequence-of-statements> }
```
            var result2 = (int x) => { 
            return x * x;
        };
        Console.WriteLine(result2(5)); // Output: 25
```

* Lambda with delegate
```
        // take an int input, multiply it with 3 and return the result 
        Func<int, int> multiply = num => num * 3;

        // calls multiply() by passing 5 as an input
        Console.WriteLine(multiply(5)); // Output: 15
```
* Passing Lambda expression in a function call
You can pass lambda express in any action call that take a value. 
```
        // array containing integer values 
        int[] numbers = { 2, 13, 1, 4, 13, 5 };

        // lambda expression as method parameter
        // returns the total count of 13 in the numbers array
        int totalCount = numbers.Count(x => x == 13);  
        Console.WriteLine("Total number of 13: " + totalCount); // Output: 2
        // take an int input, multiply it with 3 and return the result 
        Func<int, int> multiply = num => num * 3;

        // calls multiply() by passing 5 as an input
        Console.WriteLine(multiply(5)); // Output: 15
```
* ** Passing Lambda expression in a function call**
You can pass lambda express in any action call that take a value. 
```
        // array containing integer values 
        int[] numbers = { 2, 13, 1, 4, 13, 5 };

        // lambda expression as method parameter
        // returns the total count of 13 in the numbers array
        int totalCount = numbers.Count(x => x == 13);  
        Console.WriteLine("Total number of 13: " + totalCount); // Output: 2
```
## .Net core EF
In Entity core we create a c# class and Entity framework maps it to a table.
You can then perform CRUD and fetch operations on DB by using EF.
IN EF, you create a context which is a link to the database.
To SQL server or Express you need Microsoft.EntityFrameWork.SqlServer nuget packages in addition to some compulsory packages
## Database Scaffolding
> Code First
```
Create a project

Download nuget packages
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

Create a Context class in Data folder for example  Data\ContsoContext.cs
In context you use the optionsBuilder.UseSqlServer(“connection string”) if you are using sql server and sql server express.

Code-First: Create new database and perform following operations to create a database

Database command 
Install .Net Core Migration Tool
dotnet tool install -g dotnet-ef
Create Migration
dotnet-ef migrations add MyInitialMigration
Perform Database Create/Update 
dotnet-ef database update
```
> Databse First
```
1.Create a project
2.Download nuget packages

dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

3.In context you use the optionsBuilder.UseSqlServer(“connection string”) if you are using sql server and sql server express.

4.Database First, Reverse Engineering : Add all nuget packages and run commands to scaffold Model and Data

a.Install .Net Core Migration Tool
dotnet tool install -g dotnet-ef

b.Scaffold Database – Define target directories
i.dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models  
c.Scaffold Database – Save Data Annotation in Model 
dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models --data-annotations

d.Scaffold Database – Define Name Spaces, Context Name space and model name spaces
dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models --data-annotations --context-namespace ContosoPizza.Data --namespace ContosoPizza.Models

e.Re-Scaffold Database when database changed – If there is a chance that the database will change or have changed and you need to reverser engineer again so you mush protect your business logic and scaffold model in a separate folder like Models\Generated and then use a partial class for example Products.cs in Models\
i.dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models/Generated --data-annotations --context-namespace ContosoPizza.Data --namespace ContosoPizza.Models

```
<hr>

# EF Core in Console App without DI

Create Model classess and Context either manually or using Code first or Database first
In Program.cs create a context object and use it directly (see other example for using through DI)
> Display Records
```
using ContosoPizza.Data;
Console.WriteLine("Hello World!");
ContosoContext context = new ContosoContext();
foreach (var customer in context.Customers)
{
    Console.WriteLine(customer.FullName);
}
```

> Save New Record
```
using ContosoPizza.Models;
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
Product product = new Product()
{
    Name = "Pepperoni Pizza",
    Price = 18.50m
};
context.Products.Add(product);
context.SaveChanges();

```
> Fetching Record Directly all record no filter
```
using ContosoPizza.Models;
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
//Direct
foreach (var product in context.Products)
{
    Console.WriteLine(product.Name);
}

```
> Fetching records – Fluent API
```
using ContosoPizza.Models;
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
// Fluent API
var products = context.Products
    .Where(b => b.Price > 15)
    .ToList();
foreach (var product in products)
{
    Console.WriteLine(product.Name);
}

```
> Fetching records – LINQ API
```
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
// Linq Query
var linq_products = from b in context.Products
                    where b.Price > 15
                    select b;
foreach (var product in linq_products)
{
    Console.WriteLine(product.Name);
}

```
> Fetch and update a single record
```
using ContosoPizza.Models;
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
// Update
var linq_products_onepizza = context.Products
    .Where(b => b.Name == "Pepperoni Pizza")
    .FirstOrDefault();
if (linq_products_onepizza is Product)
{
    Console.WriteLine("Pepperoni Pizza found");
    linq_products_onepizza.Price = 19.99m;
    context.SaveChanges();
}

```
>Fetch and delete a single record
```
using ContosoPizza.Models;
using ContosoPizza.Data;
ContosoPizzaContext context = new ContosoPizzaContext();
// Delete Pizza
var linq_products_onepizza_delete = context.Products
    .Where(b => b.Name == "Pepperoni Pizza")
    .FirstOrDefault();
if (linq_products_onepizza_delete is Product)
{
    Console.WriteLine("Pepperoni Pizza found");
    context.Products.Remove(linq_products_onepizza_delete);
    context.SaveChanges();
    Console.WriteLine("Pepperoni Deleted");
}

```
<hr>

# EF Core in Console App With DI - Code First 
> 6-EntityFramework-CodeFirst

**Create Model classess and Context
**
Create Models/Product.cs
```
namespace ContosoPizza.Models;

public class Product
{
public int Id { get; set; }
public string Name { get; set; } = null!;
public decimal Price { get; set; }   
}
```

Create Context
```
namespace ContosoPizza.Data
{
    public class ContosoPizzaContext : DbContext
    {

        // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        // {
        //     optionsBuilder.UseSqlServer(@"Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;");            
        // }
            public ContosoPizzaContext(DbContextOptions<ContosoPizzaContext> options)
        : base(options)
    {
    }

       public DbSet<Product> Products { get; set; }
   }
}
```
Now follow instruction on how to migrate database for code first

In Program.cs we use DI to inject context

Add packages
```
dotnet add  package Microsoft.Extensions.Hosting
dotnet add  package Microsoft.Extensions.DependencyInjection
```
Add secret

```
dotnet user-secrets init
dotnet user-secrets set "ConnectionStrings:ContosoConnectionString" "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;"
```

Add and use Nuget
```
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
```



> Program.cs

```
var config = new ConfigurationBuilder().AddUserSecrets<Program>().Build();

var builder = Host.CreateDefaultBuilder(args);
// Add services to the container.
builder.ConfigureServices((_, services) =>
{
    services.AddDbContextPool<ContosoPizzaContext>(options =>
    options
    .UseSqlServer(config.GetConnectionString("ContosoConnectionString")));

});

var host = builder.Build();

// resolve service
using var scope = host.Services.CreateScope();
var context = scope.ServiceProvider.GetRequiredService<ContosoPizzaContext>();

foreach (var product in context.Products)
{
    Console.WriteLine(product.Name);
}
```
<hr>

# ASP.Net Core Razor with Entity Framework Core [DB First]
> 7-EntityFramework-Razor-WebApp
```
Create Razor Page project using builtin template
dotnet new razor -o ContosoPizza   

Open in VS Code
code -r ContosoPizza

Add Packages
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

Install Ef Tool
dotnet tool install -g dotnet-ef

Database Scaffolding: Reverse engineer Database using Database Scaffolding
dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models/Generated --data-annotations --context-namespace ContosoPizza.Data --namespace ContosoPizza.Models

Move the connection in Program.cs for DI
Delete the Onconfiguration method from ContosoContext.cs 

.protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;");


Add DI to Program.cs
builder.Services.AddDbContext<ContosoContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ContosoConnectionString")));

Add Connection string to secret Manager
Initialised .Net Secret  
dotnet user-secrets init

Create secret [Remember there is one \ in the connection string here.
dotnet user-secrets set "ConnectionStrings:ContosoConnectionString" "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" 

Check if secret saves
dotnet user-secrets list

Create CRUD Razor Pages using Razor Page Scaffolding
Install Microsoft.VisualStudio.Web.CodeGeneration.Design
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design

Install dotnet-aspnet-codegenerator tool
dotnet tool install -g dotnet-aspnet-codegenerator

Then use the dotnet code generator tool to scaffold the Razor pages (Product Page for example) by provider Context and Model Class
Create a Folder [Products under Pages]

Model Scaffolding: Create Scaffolding
dotnet aspnet-codegenerator razorpage --model Product --dataContext ContosoContext --relativeFolderPath Pages/Products --referenceScriptLibraries

Run the app
dotnet run

Browse the product index page
http://localhost:5198/Products
```
<hr>

# ASP.Net MVC Core with Entity Framework Core SL Server (Express) [DB First]
> 8-mvc

```
Install Migration tool to reverse engineer DB
dotnet tool install -g dotnet-ef

Add Nugets
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

Reverse Engineer DB
dotnet-ef dbcontext scaffold "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer --context-dir Data --output-dir Models --data-annotations --context-namespace ContosoPizza.Data --namespace ContosoPizza.Models

Init Secret in Project
dotnet user-secrets init

Add Secret 
dotnet user-secrets set "ConnectionStrings:ContosoConnectionString" "Server=.\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;"

Disable this in ContosoContext.cs
//     protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//         => optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=contoso;User Id=dev;Password=Password123.; TrustServerCertificate=True;");

Program.cs add this 
// Add services to the container.
builder.Services.AddDbContext<ContosoContext>(options =>
    options
    .UseSqlServer(builder.Configuration.GetConnectionString("ContosoConnectionString")));

builder.Services.AddControllersWithViews();

var app = builder.Build();


Test in Program.cs
// resolve service
var scope = app.Services.CreateScope();
var context = scope.ServiceProvider.GetRequiredService<ContosoContext>();   

foreach (var customer in context.Customers)
{
    Console.WriteLine(customer.FirstName + " " + customer.LastName);
}

Now you can use it in a controller and views 

```

# API Codes
- 1xx - Informational
- 2xx - Success
- 3xx - Redirect
- 4xx - Client Side Error
- 5xx - Server Side Error
```
200	OK	Results.Ok(object);
201	Created	Results.Created($"/todos/{todo.Id}", todo);
202	Accepted	
203	NonAuthoritative	
204	No Contents	Results.NoContent();
404	Not Found	Results.NotFound();

400	BadRequest
401	Unauthorized
402	PaymentRequired
403	Forbidden
404	Not Found

```

# C# APIS (Minimal API)
According to the Microsoft Docs: Minimal APIs are architected to create HTTP APIs with minimal dependencies. They are ideal for microservices and apps that want to include only the minimum files, features, and dependencies in ASP.NET Core.
> API sits at the end point and perform action and response result.
> API retuns code in header and data/empty in body
> You dont add many files or dependencies




### Middleware
Middleware is software that's assembled into an app pipeline to handle requests and responses.
Middleware executes before and after each request in nested way. ASP.net has builtin middleware for example 
Any functionality that is common in your application can be written as custom middleware. For example you can see ASP.NET code builtin middleware and your middleware

Middleware usually registers with .Use keyword which means you are registering a middleware in a pipeline

#### app.UseRewriter
URL Rewriting Middleware in ASP.NET Core

```
app.UseRewriter(new RewriteOptions().AddRedirect("tasks/(.*)", "todos/$1"));

Result
/tasks/1 will be redirect to /todos/1
/tasks/2 will be redirect to /todos/2
Redirects all incoming request from tasks/ to todos/
```
#### app.Use()
Adds a middleware in pipeline- for example below will log incoming request details on console
```
{
    Console.WriteLine($"[{context.Request.Method} {context.Request.Path} {DateTime.Now}] Started");
    await next();
    Console.WriteLine($"[{context.Request.Method} {context.Request.Path} {DateTime.Now}] Ended");

});
```

### Route Handler as Middleware
A Route handler is the block of code which is mapped to a URL and HTTP Method and executes when the URL is requested with the HTTP Method

Route Handler Example
URL: GET http://localhost:5171/todos
```
var todos = new List<Todo>();
app.MapGet("/todos", () => Results.Ok(todos));
```
You can also map handler with Parametrised Get and Post
```
app.MapGet("/todos/{id}", Results<Ok<Todo>,NotFound> (int id) =>
{
    var targetTodo = todos.SingleOrDefault(t => id==t.Id);
   return targetTodo is null 
   ? TypedResults.NotFound()
   : TypedResults.Ok(targetTodo);
});

app.MapPost("/todos", (Todo todo) =>
{
    todos.Add(todo);
    return Results.Created($"/todos/{todo.Id}", todo);
});
```
#### Filters in ASP.Net Core
Filters in ASP.NET Core allow code to run before or after specific stages in the request processing pipeline.
Fiter Types
* Authorization filters:
 * Run first.
 * Determine whether the user is authorized for the request.
 * Short-circuit the pipeline if the request is not authorized.
* Resource filters:
 * Run after authorization.
 * OnResourceExecuting runs code before the rest of the filter pipeline. For example, OnResourceExecuting runs code before model binding.
 * OnResourceExecuted runs code after the rest of the pipeline has completed.
* Action filters:
 * Run immediately before and after an action method is called.
 * Can change the arguments passed into an action.
 * Can change the result returned from the action.
 * Are not supported in Razor Pages.
* Endpoint filters:
 * Run immediately before and after an action method is called.
 * Can change the arguments passed into an action.
 * Can change the result returned from the action.
 * Are not supported in Razor Pages.
 * Can be invoked on both actions and route handler-based endpoints.
```
app.MapPost("/todos", (Todo todo) =>
{
    todos.Add(todo);
    return Results.Created($"/todos/{todo.Id}", todo);
}
)
.AddEndpointFilter(async (context, next) => {
    var taskArgument = context.GetArgument<Todo>(0);
    var errors = new Dictionary<string, string[]>();
    if(taskArgument.DueDate < DateTime.Now)
    {
        errors.Add("DueDate", ["DueDate must be in the future"]);
    }
    if(errors.Count>0)
    {
       return Results.ValidationProblem(errors);
    }
     return await next(context);
 });
``` 

* Exception filters apply global policies to unhandled exceptions that occur before the response body has been written to.
* Result filters:
 * Run immediately before and after the execution of action results.
 * Run only when the action method executes successfully.
 * Are useful for logic that must surround view or formatter execution.

### Dependency Injection in ASP.NET Core Web API using Service Container
> Service Container
> In .NET Core, a "Service Container" refers to the built-in dependency injection (DI) mechanism that manages the creation and lifetime of services within an application, allowing you to register different services and retrieve them when needed, essentially acting as a central repository for your application's dependencies

DI are inserted into Service Container.
You define Interface, Class and scope
* Interface defines the empty methods 
* Class defines the concrete implementations of those methods
* Scope defines the lifetime
#### Transient:
* A new instance of the service is created every time it is requested. Use this for lightweight services that don't need to maintain state across requests. 
* Creating new instances for every request (Transient) can impact performance, so use it cautiously. 
```
services.AddTransient<ICalculator, SimpleCalculator>();
builder.Services.AddTransient<ITaskService, InMemoryTaskService>();
```
#### Scoped:
* A single instance of the service is created for the duration of an HTTP request. Use this for services that need to share data within a single request. 
```
services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<ITaskService, InMemoryTaskService>();
```
#### Singleton:
* Only one instance of the service is created for the entire application lifecycle. Use this for services that are expensive to create and should be shared across the application.
```
services.AddSingleton<IConfiguration, Configuration>();
builder.Services.AddSingleton<ITaskService, InMemoryTaskService>();
```
<hr>

# Minimal API using DI (only uses classes and no in-mem or sql database database involved)
> 9-minimal-api-in-memory

Step 1: Create Interface
```
interface ITaskService
{
    Todo? GetTodoById(int id);
    List<Todo> GetTodos();
    Todo AddTodo(Todo todo);
    void DeleteTodoById(int id);
}
```

Step 2: Create Class
```
class InMemoryTaskService : ITaskService
{
    private List<Todo> _todos = new List<Todo>();

    public List<Todo> GetTodos()
    {
        return _todos;
    }
    public Todo? GetTodoById(int id)
    {
        return _todos.SingleOrDefault(t => t.Id == id);
    }

    public Todo AddTodo(Todo task)
    {
        _todos.Add(task);
        return task;
    }

    
    public void DeleteTodoById(int id)
    {
        var targetTodo = _todos.SingleOrDefault(t => t.Id == id);
        if(targetTodo is not null)
        {
            _todos.Remove(targetTodo);
        }
    }
    
}
```

Step 3: Register a DI with the **service container** with In Memory Service 
```
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<ITaskService, InMemoryTaskService>();
var app = builder.Build();
```

Step 4: Mapping an Route Action handler and respond using service
```
// Mapping get
app.MapGet("/todos", (ITaskService service) => Results.Ok(service.GetTodos()));

// Mapping parametarised Get
app.MapGet("/todos/{id}", Results<Ok<Todo>,NotFound> (int id, ITaskService service) =>
{
    var targetTodo = service.GetTodoById(id);
   return targetTodo is null 
   ? TypedResults.NotFound()
   : TypedResults.Ok(targetTodo);
});

// Mapping Post
app.MapPost("/todos", (Todo todo, ITaskService service) =>
{
    service.AddTodo(todo);
    return Results.Created($"/todos/{todo.Id}", todo);
}
)
```
<hr>

# Minimal API using DI & MS SQL Database Context 
> 10-minimal-api-sqlserver

```
Download nuget packages

dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.Extensions.Configuration
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Microsoft.Extensions.Hosting
dotnet add package Microsoft.AspNetCore.Hosting

create class

//Models/Todo.cs

using System;
namespace minimalapi.Models;
public class Todo
{
public int Id { get; set; }
public string Name { get; set; } = null!;
public DateTime DueDate { get; set; }
public bool IsCompleted { get; set; }
}

//create context in Data folder
using System;
using Microsoft.EntityFrameworkCore;
using minimalapi.Models;
namespace minimalapi.Data;

public class MyToDoContext : DbContext
{
    public MyToDoContext(DbContextOptions<MyToDoContext> options) : base(options)
    {
    }

    public DbSet<Todo> Todos => Set<Todo>();
}


Add DI in Program.cs
builder.Services.AddDbContext<MyToDoContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ToDoConnectionString")));

Init Secret in Project
dotnet user-secrets init

Add Secret 
dotnet user-secrets set "ConnectionStrings:ToDoConnectionString" "Server=.\SQLExpress;Database=Todos;User Id=dev;Password=Password123.; TrustServerCertificate=True;"

Create Migration
dotnet-ef migrations add MyInitialMigration

Perform Database Create/Update 
dotnet-ef database update

// now in Program.cs you can use data from database
app.MapGet("/todos", async (MyToDoContext context) => Results.Ok(await context.Todos.ToListAsync()));
```
<hr>

# API (MVC) with ASP.NET Core & In-memory storage (Testing, CICD, Docker, Kubenetes)
> 11-Api-MVC-In-Mem

Create a project.
```
dotnet new webapi --use-controllers -o TodoApi
dotnet add package Microsoft.EntityFrameworkCore.InMemory
dotnet add package Swashbuckle.AspNetCore
```
open project
```
cd TodoApi
```

Configure SSL
```
dotnet dev-certs https --trust
dotnet run --launch-profile https
```

Add Swagger - Edit Program.cs
```
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.UseSwagger();
    app.UseSwaggerUI(c=>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
    });
}
```

Add Folder Models
Add Class TodoItem.cs
```
using System;
namespace TodoApi.Models;
public class TodoItem
{
    public long Id { get; set; }
    public string? Name { get; set; }
    public bool IsComplete { get; set; }
}
```
Add a database context
Add a TodoContext.cs file to the Data  folder.
```
using System;
using Microsoft.EntityFrameworkCore;
using TodoApi.Models;

namespace TodoApi.Data;

public class TodoContext : DbContext
{
    public TodoContext(DbContextOptions<TodoContext> options)
        : base(options)
    {
    }

    public DbSet<TodoItem> TodoItems { get; set; } = null!;

}
```

Register the database context
In ASP.NET Core, services such as the DB context must be registered with the dependency injection (DI) container. The container provides the service to controllers.

Adds the database context to the DI container.
Specifies that the database context will use an in-memory database.

Update Program.cs with the following highlighted code:
```
using Microsoft.EntityFrameworkCore;
using TodoApi.Data;
using TodoApi.Models;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddDbContext<TodoContext>(opt =>
    opt.UseInMemoryDatabase("TodoList"));
```

Now, Create a controller in the Controller folder [Controllers\TodoController.cs]
```
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TodoApi.Data;
using TodoApi.Models;

namespace TodoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoController : ControllerBase
    {
        private readonly TodoContext _context;

        public TodoController(TodoContext context)
        {
            _context = context;
        }

        // GET: api/Todo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TodoItem>>> GetTodoItems()
        {
            return await _context.TodoItems.ToListAsync();
        }

        // GET: api/Todo/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TodoItem>> GetTodoItem(long id)
        {
            var todoItem = await _context.TodoItems.FindAsync(id);

            if (todoItem == null)
            {
                return NotFound();
            }

            return todoItem;
        }

        // POST: api/Todo
        [HttpPost]
        public async Task<ActionResult<TodoItem>> PostTodoItem(TodoItem item)
        {
            _context.TodoItems.Add(item);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetTodoItem), new { id = item.Id }, item);
        }

        // PUT: api/Todo/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTodoItem(long id, TodoItem item)
        {
            if (id != item.Id)
            {
                return BadRequest();
            }

            _context.Entry(item).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE: api/Todo/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTodoItem(long id)
        {
            var todoItem = await _context.TodoItems.FindAsync(id);

            if (todoItem == null)
            {
                return NotFound();
            }

            _context.TodoItems.Remove(todoItem);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }

}
```
Now, run the app 
```
donet run
```
Using TodoApi.http file - send request

```
@TodoApi_HostAddress = http://localhost:5115

###
Post {{TodoApi_HostAddress}}/api/Todo
Content-Type: application/json

{
  "id": 1,
  "name": "My new item 1",
  "isComplete": true
}

###
Post {{TodoApi_HostAddress}}/api/Todo
Content-Type: application/json

{
  "id": 2,
  "name": "My new item 2",
  "isComplete": true
}


###
GET {{TodoApi_HostAddress}}/api/Todo
```

### Adding Docker container support for web API (MVC) with ASP.NET Core & In-memory storage

> Using dotnet publish

**With dotnet -t:PublishContainer you don't need to create Dockerfile**
Edit csproj file and add 
```
<ContainerRepository>api-mvc-in-mem</ContainerRepository>
```
**Create Image - This wil create a container image **
```
dotnet publish -t:PublishContainer
```
**- Run Container**
- Run with a random container name 

```
docker run -p api-mvc-in-mem:latest
```

- Run with your own container name
```
docker run --name api-app api-mvc-in-mem 
```
- Run on a specific port and assign a name to container
```
docker run -p 5115:8080 --name my-api-app api-mvc-in-mem
```

**- Test App using todoapi.http**
```
@TodoApi_HostAddress = http://localhost:5115

###
GET {{TodoApi_HostAddress}}/api/Todo

###
Post {{TodoApi_HostAddress}}/api/Todo
Content-Type: application/json

{
  "id": 2,
  "name": "My new item 2",
  "isComplete": true
}

###
GET {{TodoApi_HostAddress}}/api/Todo
```

**- Stop Container**
docker stop my-api-app

**- Remove container**
docker rm my-api-app

**- Remove image**
docker rmi api-mvc-in-mem



> Using Docker

**- Generating Docker files**
You can add Docker files to your workspace by opening the Command Palette (Ctrl+Shift+P) and using Docker: Add Docker Files to Workspace command. 

**- Fix Docker file**
-- fix path of .csproj file
-- Fix IP ENV ASPNETCORE_URLS=http://8080:5115

**Docker File**
The docker file is inside the project folder
```
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 5115

ENV ASPNETCORE_URLS=http://8080:5115

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG configuration=Release
WORKDIR /src
COPY ["TodoApi.csproj", "./"]
RUN dotnet restore "TodoApi.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "TodoApi.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "TodoApi.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TodoApi.dll"]
```

**- Build an image**
```
docker build . -t api-mvc-in-mem
```
**- Run Container**
- Run with random container name 

```
docker run -p api-mvc-in-mem:latest
```
**- Run with your own container name**
```
docker run --name api-app api-mvc-in-mem 
```
**- Run on a specific port and assign a name of container**
```
docker run -p 55998:8080 --name my-api-app api-mvc-in-mem
```
**- Test App using todoapi.http**
```
@TodoApi_HostAddress = http://localhost:5115

###
GET {{TodoApi_HostAddress}}/api/Todo

###
Post {{TodoApi_HostAddress}}/api/Todo
Content-Type: application/json

{
  "id": 2,
  "name": "My new item 2",
  "isComplete": true
}

###
GET {{TodoApi_HostAddress}}/api/Todo
```
**Connect to Container Terminal**
```
docker exec -it api-mvc-in-mem /bin/sh

## Print Env
printenv

```
**- Stop Container**
docker stop my-api-app

**- Remove container**
docker rm my-api-app

**- Remove image**
docker rmi api-mvc-in-mem

### Managing Environment variable in docker

With docker, you can set environment variables in docker-compose.yml
For example
```
services:
  todoapi:
    image: mcr.microsoft.com/dotnet/aspnet:5.0
    container_name: todoapi
    ports:
      - "5000:80"
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
    volumes:
```

Now you can set ASPNETCORE_ENVIRONMENT depending on the environment 
You might notice the environment is set up with the environment with “Development” for our ASP.NET application.
You might ask, if “Development” is set like this, I will need to change “Staging” or “Production” every time we need to build for a different environment.
Don’t worry, you can just remove the environment: in the docker-compose.yml when running the service. Then, pass in custom environment variables in command.
```
docker-compose up -e ASPNETCORE_ENVIRONMENT=Production
```
By doing this, in CI/CD like GitHub Actions, you can write the instruction to listen different branch commit to build different env by running different docker-compose command.

### Publish MVC API to Docker Hub
```
docker build -t api-mvc-in-mem .
docker tag api-mvc-in-mem wasishah102/api-mvc-in-mem
docker push wasishah102/api-mvc-in-mem
```

#### create pipeline and push to docker hub
1. Create a Azure DevOps project
2. Create a service connection from azure Devops Project to github to fetch the project (in pipeline)
3. Create a service connection from Azure Devop project to Docker Hub

Demo CICD [Build / Test / Code Coverage (see next section) / Publish to docker ]
```
trigger:
- main

resources:
- repo: self

variables:
  tag: '$(Build.BuildId)'

stages:
- stage: Build
  displayName: Build image
  jobs:
  - job: Build
    displayName: Build & Test
    pool:
      vmImage: ubuntu-latest
    steps:
    - task: DotNetCoreCLI@2
      displayName: Test
      inputs:
        command: test
        projects: '**/*[Tt]est*/*.csproj'
        arguments: '--configuration $(BuildConfiguration) --collect:"XPlat Code Coverage"'

    - task: PublishCodeCoverageResults@2
      displayName: 'Publish Code Coverage'
      inputs:
        codeCoverageTool: Cobertura
        summaryFileLocation: '$(System.DefaultWorkingDirectory)/**/coverage.cobertura.xml'
        failIfCoverageEmpty: true

    - task: Docker@2
      displayName: Docker Build and Push 
      inputs:
        containerRegistry: 'azure-docker-connection'
        repository: 'wasishah102/api-mvc-in-mem'
        command: 'buildAndPush'
        Dockerfile: '**/Dockerfile'
        tags: '$(tag)'
  
```


### Adding Tests and code coverage
1. Add a test project
2. Add reference to project
3. Add tests to test your API controllers
4. Add Code coverate Support

Adding Test Project
- Right click on the solution and click add project
- Name project as [Api-MVC-In-Mem.Test]
- Create a class [TodoControllerTest.cs]
```
using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Moq;
using TodoApi.Controllers;
using TodoApi.Data;
using TodoApi.Models;

namespace Api_MVC_In_Mem_Test;

public class TodoControllerTest
{

[Fact]
public async Task TestTodoApiAsync()
{
    // Arrange
     var option = new DbContextOptionsBuilder<TodoContext>()
        .UseInMemoryDatabase(databaseName: "testdatabase")
        .Options;
    // Insert seed data into the database using one instance of the context
    using (var context = new TodoContext(option))
    {
        context.TodoItems.Add(new TodoItem { Id = 1, Name = "Test1" });
        context.TodoItems.Add(new TodoItem { Id = 2, Name = "Test2" });
        context.SaveChanges();
    }
    // Use a clean instance of the context to run the test
    using (var context = new TodoContext(option))
    {
        var controller = new TodoController(context);
        var result = await controller.GetTodoItems();
        var items = result.Value.ToList();
        // Assert
        Assert.Equal(2, items.Count);
  
    }
}
}
```

**Add Code coverage tool**
```
dotnet add package coverlet.collector
```

Run Test without code coverage collection
```
dotnet test
```
![image](https://github.com/user-attachments/assets/48063a15-e75a-4ce5-99dc-803c2abb272b)

With Collection via Coverlet [Generates XML file]
```
dotnet test --collect:"XPlat Code Coverage"
```
With collection with built-in dotnet coverage collctor  [Generates XML File]
```
dotnet test --collect:"Code Coverage"
```
**How to export code coverage xml file to html?**
Now that you're able to collect data from unit test runs, you can generate reports using ReportGenerator. To install the ReportGenerator NuGet package as a .NET global tool, use the dotnet tool install command:
```
dotnet tool install -g dotnet-reportgenerator-globaltool

reportgenerator -reports:coverage.cobertura.xml -targetdir:coveragereport
```
#### Adding Test and code coverage in CICD
CICD > Test with Code Coverage
```
    - task: DotNetCoreCLI@2
      displayName: Test
      inputs:
        command: test
        projects: '**/*[Tt]est*/*.csproj'
        arguments: '--configuration $(BuildConfiguration) --collect:"XPlat Code Coverage"'
```
![image](https://github.com/user-attachments/assets/fa93c1d1-9941-4072-bb64-184285e87694)

CICD > Cover Coverage Report Publish
```
    - task: PublishCodeCoverageResults@2
      displayName: 'Publish Code Coverage'
      inputs:
        codeCoverageTool: Cobertura
        summaryFileLocation: '$(System.DefaultWorkingDirectory)/**/coverage.cobertura.xml'
        failIfCoverageEmpty: true
```
![image](https://github.com/user-attachments/assets/5d1f39ec-f4c2-424b-91e7-ef34a81fdbe0)


### Publish to AKS

Adding Kubernetes Deployment

- Create Kuberetes Cluster


# Create a new AKS cluster in the Free tier
$RESOURCE_GROUP="rg-aks-api-mvc-in-mem"
$CLUSTER_NAME ="aks-my-cluster-08889"

az group create --name $RESOURCE_GROUP --location uksouth


az aks create --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME --tier free  --generate-ssh-keys

az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME --overwrite-existing

Test Locally 

kubectl apply -f manifests/dep.yaml

kubectl get pod,deploy,svc

create cicd to deploy to aks
- create service connection

### Publish to Local Cluster.

- Create local CICD agent (see docs)

- First things first you should connect your local Kubernetes cluster with Azure devops.
```
Get the output of the below command and paste it on the box.
kubectl config view --raw
```
- go on Project settings -> Service connections and select Kubernetes
- selecte kubeconfig
- paste the output of previous command on the box
-  Then select untrusted certificates and add press verify and save.
-  On the tasks of the release pipeline you should select the agent pool, as a result your self hosted agent.
-  In CICD (job) section define your agent pool name
```
   pool: MyCustomAgentPool
```
- Complete pipeline example
```
trigger:
- main

resources:
- repo: self

variables:
  tag: '$(Build.BuildId)'

stages:
- stage: AKS
  displayName: To AKS Stage
  jobs:
  - job: AKSjob
    displayName: to AKS Job
  
    steps:
 #   - task: CmdLine@2
 #     inputs:
 #       script: |
 #             echo "$(Pipeline.Workspace)"
 #             tree $(Pipeline.Workspace)
 #   - task: CmdLine@2
 #     inputs:
#        script: |
#          echo Write your commands here          
#          cat $(Pipeline.Workspace)/s/TodoApi/manifests/dep.yaml
    - task: CmdLine@2
      inputs:
        script: |
          kubectl config view
    - task: Kubernetes@1
      displayName: 'default config view'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        namespace: 'default'
        command: 'config'
        arguments: 'view'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry'
    - task: Kubernetes@1
      displayName: 'config get-context'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        namespace: 'default'
        command: 'config'
        arguments: 'get-contexts'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry'    


    - task: Kubernetes@1
      displayName: 'set-context docker-desktop --user=docker-desktop'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        command: 'config'
        arguments: 'set-context docker-desktop --user=docker-desktop'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry' 
    - task: Kubernetes@1
      displayName: 'auth whoami'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        command: 'auth'
        arguments: 'whoami'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry' 

    - task: Kubernetes@1
      displayName: 'config get-contest - again'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        namespace: 'default'
        command: 'config'
        arguments: 'get-contexts'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry' 
    - task: Kubernetes@1
      displayName: 'cluster-info'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        namespace: 'default'
        command: 'cluster-info'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry'
    - task: Kubernetes@1
      displayName: 'version'
      inputs:
        connectionType: 'Kubernetes Service Connection'
        kubernetesServiceEndpoint: 'kube-local-cluster-3'
        namespace: 'default'
        command: 'version'
        secretType: 'dockerRegistry'
        containerRegistryType: 'Azure Container Registry'


    - task: KubernetesManifest@1
      displayName: 'Deploy manifests yaml'
      inputs:
        kubernetesServiceConnection: kube-local-cluster-3
        namespace: default
        manifests: |
           $(Pipeline.Workspace)/s/TodoApi/manifests/dep.yaml
           $(Pipeline.Workspace)/s/TodoApi/manifests/services.yaml
        containers: wasishah102/api-mvc-in-mem
    
```

You can now browser using port 8081 becuase the app is mapped to 8080 but service is mapped to 8081
![image](https://github.com/user-attachments/assets/e97cd1ea-a771-4382-8eca-e14a8381f2fc)

```
http://kubernetes.docker.internal:8010/swagger/index.html
or
http://localhost:8010/swagger/index.html
```
