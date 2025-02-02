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
1.	Func – return value
2.	Action – do not return value
3.	Predicate – Returns Boolean

## LINQ Language Integrated Query:
A: Allow to query a database or array without SQL.
1. LINQ allows you perform filtering, ordering, and grouping operations on data sources with a minimum of code.
2. Allow to query with filters on in memory, xml, Json or database objects like sql query and return the results.

### Linq Syntax:
You can search any collection using
1.	Query Syntax : 	Query syntax is similar to SQL (Structured Query Language) for the database.
```
var result = from s in stringList
            where s.Contains("Tutorials") 
            select s;
```
2.	Method Syntax : Uses Lambda expression
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



var testScores2 = scores
    .Where(s => s > 80)
    .OrderByDescending(s => s);

foreach (var testScore in testScores2)
{
    Console.WriteLine(testScore);
}

// Output: 93 90 82 82 

```

LAMBDA:
A lambda expression can also be seen as an anonymous function. A function that doesn’t have a name and doesn’t belong to any class. 
The lambda expression is a shorter way of representing anonymous method using some special syntax.
*	With lambda you can write inline function and call them.
*	Lambda expressions is a way of defining anonymous functions.
*	A lambda expression is a short block of code which takes in parameters and returns a value. 
*	To create a lambda expression, you specify input parameters (if any) on the left side of the lambda operator and an expression or a statement block on the other side.
*	Basic Syntax
* ( one input-parameter) => expression
	var result = (int x) => x * x;
	Console.WriteLine(result(5)); // Output: 25
* (two input-parameters) => expression
	        var result1= (int x, int y) => x+y;
	        Console.WriteLine(result1(5,3)); // Output: 8
* (input-parameters) => { <sequence-of-statements> }
	        var result2 = (int x) => { 
	            return x * x;
	        };
	        Console.WriteLine(result2(5)); // Output: 25
* Lambda with delegate
LAMBDA:
A lambda expression can also be seen as an anonymous function. A function that doesn’t have a name and doesn’t belong to any class. 
The lambda expression is a shorter way of representing anonymous method using some special syntax.
*	With lambda you can write inline function and call them.
*	Lambda expressions is a way of defining anonymous functions.
*	A lambda expression is a short block of code which takes in parameters and returns a value. 
*	To create a lambda expression, you specify input parameters (if any) on the left side of the lambda operator and an expression or a statement block on the other side.
*	Basic Syntax
* ( one input-parameter) => expression
	var result = (int x) => x * x;
	Console.WriteLine(result(5)); // Output: 25
* (two input-parameters) => expression
	        var result1= (int x, int y) => x+y;
	        Console.WriteLine(result1(5,3)); // Output: 8
* (input-parameters) => { <sequence-of-statements> }
	        var result2 = (int x) => { 
	            return x * x;
	        };
	        Console.WriteLine(result2(5)); // Output: 25
* Lambda with delegate
	        // take an int input, multiply it with 3 and return the result 
	        Func<int, int> multiply = num => num * 3;
	
	        // calls multiply() by passing 5 as an input
	        Console.WriteLine(multiply(5)); // Output: 15
* Passing Lambda expression in a function call
	You can pass lambda express in any action call that take a value. 
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
* Passing Lambda expression in a function call
	You can pass lambda express in any action call that take a value. 
	        // array containing integer values 
	        int[] numbers = { 2, 13, 1, 4, 13, 5 };
	
	        // lambda expression as method parameter
	        // returns the total count of 13 in the numbers array
	        int totalCount = numbers.Count(x => x == 13);  
	        Console.WriteLine("Total number of 13: " + totalCount); // Output: 2
