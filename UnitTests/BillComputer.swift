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
    // Pretend this has to gather some data from a network
   return doSomeNetworkRequest(with: bills)
  }
  
  private func doSomeNetworkRequest(with bills: [Bill])-> Double {
    // reduce loops through the array of bills
    return  bills.reduce(0.0) { (result, bill) -> Double in
      bill.amount + result
    }
  }
}
