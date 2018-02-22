import XCTest
@testable import UnitTests

class PersonTests: XCTestCase {
  
  // 3 Types of Unit Tests
  
  // 1. Return Value
  class FakePerson: Person {
    static var count = 0
    override init(firstName: String, lastName: String) {
      type(of: self).count += 1
      super.init(firstName: firstName, lastName: lastName)
    }
  }
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
    FakePerson.count = 0
  }
  
  func test_fullName() {
    // Arrange
    let sut = Person(firstName: "Frank", lastName: "Edge")
    // Act
    let result = sut.fullName
    let expected = "Frank Edge"
    // Assert
    XCTAssertEqual(result, expected)
  }
  
  // 2. State Test
  
  func test_Person_init_called_twice() {
    
    // Arrange
    _ = FakePerson(firstName: "", lastName: "")
    _ = FakePerson(firstName: "", lastName: "")
    // Act
    let result = FakePerson.count
    let expected = 2
    // Assert
    XCTAssertEqual(result, expected)
  }
  
  func test_Person_init_called_once() {
    // Arrange
    _ = FakePerson(firstName: "", lastName: "")
    // Act
    let result = FakePerson.count
    let expected = 1
    // Assert
    XCTAssertEqual(result, expected)
  }
  

  
  func test_firstName() {
    // Arrange
    // Act
    // Assert
  }
  
  func test_init_bill_called_once() {
    // Arrange
    // Act
    // Assert
  }
  
  func test_pay_bill() {
    // Arrange
    let sut = Person(firstName: "", lastName: "")
    // Act
    sut.pay(Bill(amount: 0.0))
    let result = sut.bills.count
    let expected = 1
    // Assert
    XCTAssertEqual(result, expected)
  }
  
}


















