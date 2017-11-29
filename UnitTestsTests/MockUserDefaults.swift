//
//  MockUserDefaults.swift
//  Pedometer
//
//  Created by steve on 2017-08-13.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation
@testable import Pedometer


final class MockUserDefaults: UserDefaultsProtocol {
  
  static var timesInitialized = 0
  
  init() {
    MockUserDefaults.timesInitialized += 1
  }
  
  var values: [String:Any] = [:] {
    didSet {
      print(#line, values[Constant.kConfettiOnDatesKey] ?? "No value!!")
    }
  }
  
  func set(_ value: Any?, forKey key: String) {
    values[key] = value
  }
  
  func value(forKey key: String) -> Any? {
    return values[key]
  }
}
