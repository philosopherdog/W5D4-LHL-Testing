//
//  PersonManager.swift
//  UnitTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

class PersonManager {
  
  var defaults: UserDefaults? {
    get {
      if self.defaults == nil {
        return UserDefaults.standard
      }
      return self.defaults
    }
  }
  
  func save(person: Data, with defaults: UserDefaults){
    defaults.setValue(person, forKey: "personKey")
  }
  
}
