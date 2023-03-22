# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# check if a string includes TODO

def todo_checker(string)
   split = string.split(" ")
   split.each do |word|
   if string.include?("TODO")
   return true
   else
   return false
   end
end

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

todo_checker("this is not a task") => [false]
todo_checker("this is a TODO") => [true]
todo_checker("this is not a TOODOO") => [false]
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
