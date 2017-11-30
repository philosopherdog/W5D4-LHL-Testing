//
//  Person.swift
//  UnitTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation


class Person: NSObject, NSCoding {
  
  // MARK: Encoding/Decoding
  
  struct Key {
    // Used to avoid string literal keys
    
    static let firstName = "firstNameKey"
    static let lastName = "lastNameKey"
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.firstName, forKey: Key.firstName)
    aCoder.encode(self.lastName, forKey: Key.lastName)
  }
  
  required convenience init(coder aDecoder: NSCoder) {
    let fn = aDecoder.decodeObject(forKey: Key.firstName) as? String
    let ln = aDecoder.decodeObject(forKey: Key.lastName) as? String
    // if fn/ln are nil then initialize with ""
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
  
  //MARK: Bills (State Test)
  
  var bills = [Bill]()
  
  func pay(_ bill: Bill) {
    bills.append(bill)
  }
  
  //MARK: Total Owing (Stub)
  
  var totalOwing: Double?
  
  func totalOwing(for bills: [Bill], with billComputer: BillComputer) {
    self.totalOwing = billComputer.compute(bills)
  }

}
