//
//  Person.swift
//  UnitTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation


class Person: NSCoding {
  
  // MARK: Encoding/Decoding
  
  struct Keys {
    static let firstNameKey = "firstNameKey"
    static let lastNameKey = "lastNameKey"
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.firstName, forKey: Keys.firstNameKey)
    aCoder.encode(self.lastName, forKey: Keys.lastNameKey)
  }
  
  required convenience init(coder aDecoder: NSCoder) {
    let fn = aDecoder.decodeObject(forKey: Keys.firstNameKey) as? String
    let ln = aDecoder.decodeObject(forKey: Keys.lastNameKey) as? String
    self.init(firstName: fn ?? "", lastName: ln ?? "")
  }
  
  // MARK: Init
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  // MARK: Properties
  
  let firstName: String
  let lastName: String
  
  var fullName: String {
    get {
      return "\(firstName) \(lastName)"
    }
  }
  
  //MARK: Bills
  
  var bills = [Bill]()
  
  func pay(_ bill: Bill) {
    bills.append(bill)
  }

}
