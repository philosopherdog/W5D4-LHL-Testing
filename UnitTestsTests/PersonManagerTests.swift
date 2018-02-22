import XCTest
@testable import UnitTests

class PersonManagerTests: XCTestCase {
  
  // Make sure MockUserDefaults is only created once
  func test_mockUserDefaults_created_once() {
    
  }
  
  // Demonstrate need for teardown
  func test_mockUserDefaults_created_twice() {
    
  }
  
  // Test save user using a mock
  func test_save_user_count_1() {
    // Arrange
    let sut = PersonManager()
    let person = Person(firstName: "fred", lastName: "frank")
    let data = NSKeyedArchiver.archivedData(withRootObject: person)
    let mock = MockUserDefaults()
    
    // Act
    sut.save(person: data, with: mock)
    let result = mock.values.count
    let exected = 1
    // Assert
    XCTAssertEqual(result, exected)
  }
  
}
