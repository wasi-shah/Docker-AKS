# YAML Basics

## YAML Comments
* Space after the colon is mandatory to differentiate key and value
```
# Defining simple key-value pairs
name: John Smith
age: 23
```
## Key-Value Pairs
* Space after the colon is mandatory to differentiate key and value
```
# Defining simple key-value pairs
name: John Smith
age: 23
```

## YAML  Dictionary Or Map
* Set of properties grouped after an item
* Equal amount of blank space required for all the items under a dictionary
```
  person: # Dictionary 
    name: John Smith
    age: 23
    city: London

```

## YAML  Array or List
* Dash indicates an element of an array
```
  hobbies: # List  
    - cycling
    - cooking
```

### Multiple items Array or List
* Dash indicates an element of an array
* Add more items before second dash to add item inside an item
```
  friends: # Array
    - name: friend1 # Item 1 with 2 items
      age: 22
    - name: friend2 # Item 2 with 2 items
      age: 25    
```
