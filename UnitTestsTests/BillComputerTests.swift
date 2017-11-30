//
//  BillComputerTests.swift
//  UnitTestsTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

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
    
  }
  
}
