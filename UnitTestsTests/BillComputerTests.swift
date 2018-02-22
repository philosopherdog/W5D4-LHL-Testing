import XCTest
@testable import UnitTests

class BillComputerTests: XCTestCase {
  
  // Using a stub of BillComputer test to see if total owing is correctly updated on person
  
  class BillComputerStub: BillComputer {
    override func compute(_ bills: [Bill]) -> Double {
      return 100
    }
  }
  
  func test_billComputer_sets_totalOwing() {
    // Arrange
    let sut = Person(firstName: "", lastName: "")
    // Act
    sut.totalOwing(for: [], with: BillComputerStub())
    let result = sut.totalOwing!
    let expected = 100.0
    // Assert
    XCTAssertEqual(result, expected)
  }
  
}
