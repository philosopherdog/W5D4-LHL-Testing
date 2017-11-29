//
//  BillComputer.swift
//  UnitTests
//
//  Created by steve on 2017-11-29.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

class BillComputer {
  
  func compute(_ bills: [Bill])-> Double {
   return doSomeNetworkRequest(with: bills)
  }
  
  private func doSomeNetworkRequest(with bills: [Bill])-> Double {
    return  bills.reduce(0) { (result, bill) -> Double in
      bill.amount + result
    }
  }
}
