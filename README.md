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
- Unit tests are distinct from *functional tests* which test larger chunks of code and how they function together. So, for instance in a *functional test* you might hit the actual network. 


# TDD
- TDD is the discipline of writing unit tests first.
- Sometimes called "Red, Green, Refactor".
- You start by writing a single failing test.
- Then you write the simplest code to make that test pass.
- Finally, you refactor your production code and test code.

![](imgs/tdd.png)


# (Dis)advantages of Unit Testing
### Pros: 
- We spend more time writing code rather than hanging out in the debugger.
- Find bugs early in the development process.
- Provides living documentation.
- Guides better code architecture.
- Allows us to make changes to our code with more confidence.
- Catches regression bugs in later versions.
- Forces us to reason more thoroughly about our code.
- Sleep better at night.

### Cons:
- We write a lot more code!
- It takes developer time away from adding exciting features.
- Not as exciting as adding features.
- If done incorrectly it can hamper progress.
- Sleep worse at night.

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
![](imgs/return.png)
2. State test: 
	- calling a function causes a side effect (like a property changes value).
	- query the object to see if the changed state matches your expectations. 
![](imgs/state.png)
3. Interaction test:
	- Your test calls a method and that method calls something else.
	- Eg. Your PersonManager has a saveUser method that saves the passed in Person to UserDefaults.
	- We don't want to use the actual UserDefaults to test this. Why not?	![](imgs/interaction.png)

# Demo
- Return value: create a Person and return fullName
- State test: call sut.invoice(bill) and check whether the bill got added to the bills list.


# Interaction Tests & Dependency injection
- Before we talk about the 2 types of interaction tests, let's take a closer look at dependencies.
- When you are doing interaction testing your sut (System Under Test) is dependent on other classes or modules.
- We usually want to use fake dependencies and not real ones, we want to make sure we "inject" these dependencies rather than new them up internally.

```swift
// Wrong
class PersonManager {
  private let defaults: UserDefaults
  init() {
    defaults = UserDefaults.standard
  }
}

// Right
class PersonManager {
  private let defaults: UserDefaults
  init(defaults: UserDefaults) {
    self.defaults = defaults
  }
}
```

4 Ways of Doing Dependency Injection:
1. Extract and override:
		- Handy when you can't change method signatures.
    - Easy. 
    - Fragile if you refactor the name of the extracted method.

```swift
// Wrong
class PersonManager {
  
func save(person: Data){
	let defaults = UserDefaults.standard
	defaults.setValue(person, forKey: "personKey")
	}
}

// Right
class PersonManager {
  
  func save(person: Data){
    defaults().setValue(person, forKey: "personKey")
    }
  
  func defaults()->UserDefaults {
    return UserDefaults.standard
  }
}

// Subclass & Override

class TestablePersonManager: PersonManager {
  override func defaults() -> UserDefaults {
    return //something?
  }
}

``` 
2. Method injection: 
	- Use if you have the power change the signature.
```swift
class PersonManager {
  
func save(person: Data, with defaults: UserDefaults){
defaults.setValue(person, forKey: "personKey")
}
  
}
```
3. Property injection:
```swift
class PersonManager {
  
  var defaults: UserDefaults?
  
  func save(person: Data){
    defaults?.setValue(person, forKey: "personKey")
  }
  
}
```
		
4. Constructor injection:
	- Passes in the dependencies at initialization.
	- Prefer constructor injection because it makes the dependencies more explicit.

```swift
class PersonManager {
  
  var defaults: UserDefaults
  
  init(defaults: UserDefaults) {
    self.defaults = defaults
  }
  
  func save(person: Data){
    defaults.setValue(person, forKey: "personKey")
  }
  
}
```	

Stubs Vs Mocks:

- We usually don't want to inject an actual defaults object or whatever other dependency. We want a fake of some kind.
- There are 2 fundamental types of fake objects: Stubs and Mocks.
- The difference has to do with what object the test queries. 
- Tests query the sut for stubs.
- For mocks the tests query the mock object.

![](imgs/stub.png)

![](imgs/mock.png)

#### Note
- `@testable import NameOfTarget` removes need to make everything public or open in the file, or add the file to the test target.

# Resources
- if you want to start with TDD start with a codekata [link](https://qualitycoding.org/tdd-kata/)
- Jon Reid's [Quality Coding](https://qualitycoding.org) is a good site to start.
- A lot of the ideas in this lecture are inspired by [this]() video.
