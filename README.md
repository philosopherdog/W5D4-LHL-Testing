Testing. Bowling game example.

# What is testing and why do it?
- Testing only relevant for projects that are intended to live past initial ship date.
- Testing is a way to objectively verify quality.
- We already test our code by stepped through our code and using the debugger. 
- What are some problems with testing our code this way?
- Writing unit tests is a way for us to write test code that is not shipped with production code.

# Types of Software Tests
- There are many types of software tests, such as security testing, installation testing, accessibility testing, etc.  [Software Testing](https://en.wikipedia.org/wiki/Software_testing) 
- Software testing and QA (Quality Assurance) is a separate dicipline. 
- We are only concerned about *unit testing*, today.
- Xcode has an [interface testing framework](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) 
- Unit testing tests small units of code, usually functions/methods.
- Unit tests are distinct from *integration tests* which test larger chunks of code and how they function together. 
- Unit testing is sometimes also called TDD (test driven development), but TDD is the discipline of writing unit tests first.

# (Dis)advantages of Unit Testing
### Pros: 
- We spend more time writing code rather than hanging out in the debugger.
- Find bugs early in the development process.
- Provides living documentation.
- Guides better code architecture.
- Allows us to make changes to our code with more confidence.
- Catches regression bugs in later versions.
- Forces us to reason more thoroughly about our code.

### Cons:
- We write a lot more code!
- It takes developer time away from adding exciting features.
- Not as exciting as adding features.
- If done incorrectly it can hamper progress.

# Some Beginning Rules
- Only ever test publicly exposed methods. Why?
- Never test Apple's code!
- Never test actual API calls. Why? 
- Simple classes are much easier to test. Make your classes more modular.

# The 3 A's Of Unit Testing
1. Arrange. 
2. Act.
3. Assert.

// Arrange
// Act
// Assert

# 3 Types of Unit Tests
1. Return value:  
	- calling a function returns a value. 
	- compare it to an expected value.
	- *Example*

2. State test: 
	- calling a function causes a side effect (like a property changes value).
	- query the object to see if the changed state matches your expectations. 
	- *Example*

3. Interaction test:
	- Your test calls a method and that method calls something else.
	- Eg. Your PersonManager has a saveUser method that saves the passed in Person to UserDefaults.
	- We don't want to use the actual UserDefaults to test this. Why not?

# Dependency injection.

- TDD changes the way you write your code.
- When you are doing interaction testing your sut (System Under Test) may be dependent on other classes or modules.
- Because we usually want to use fake dependencies and not real ones, we want to make sure we "inject" these dependencies rather than new them up internally.
4 Types of Dependency Injection:
    1. Extract and override:
        - Example 
        - Easy. 
        - But you have to change your production code. Fragile? 
        - Handy when you can't change method signatures.
    2. Method injection: 
        - You have the power change the signature.
        - NextID: userDefaults (pass the property in)
    3. Property injection:
    4. Constructor injection:
    - InitWithUserDefaults:
- Prefer constructor injection
- It makes the dependencies explicit.

Stubs Vs Mocks:





@testable removes need to make everything public or open

XCTAssert different types.

- Provides documentation

-   Things we shouldn’t test in unit tests, Apple’s code. We don’t want to do actual network requests. 
- Write tests against someone else’s code

What is TDD?
- write tests first.
- red/green/refactor
- Write a failing test first
- Start with the most degenerate test.


# Resources
- if you want to start with TDD start with a codekata link https://qualitycoding.org/tdd-kata/ 
