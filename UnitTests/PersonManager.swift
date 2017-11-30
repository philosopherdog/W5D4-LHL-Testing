//
//  PersonManager.swift
//  UnitTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

class PersonManager {
  
  func save(person: Data, with defaults: UserDefaults){
    defaults.set(person, forKey: "personKey")
  }
  
}
