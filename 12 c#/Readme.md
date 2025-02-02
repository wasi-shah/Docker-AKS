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