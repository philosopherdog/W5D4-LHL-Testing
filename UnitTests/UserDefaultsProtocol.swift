//
//  UserDefaultsProtocol.swift
//  Pedometer
//
//  Created by steve on 2017-08-13.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

protocol UserDefaultsProtocol: class {

  func set(_ value: Any?, forKey defaultName: String)
  func value(forKey key: String) -> Any?
}



extension UserDefaults: UserDefaultsProtocol {

}


