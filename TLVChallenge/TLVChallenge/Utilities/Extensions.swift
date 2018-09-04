//
//  Extensions.swift
//  TLVChallenge
//
//  Created by Aurora Rodríguez on 9/3/18.
//  Copyright © 2018 Aurora Rodríguez. All rights reserved.
//

import Foundation

extension Data {
  fileprivate func decodeNibble(_ u: UInt16) -> UInt8? {
    switch(u) {
    case 0x30 ... 0x39:
      return UInt8(u - 0x30)
    case 0x41 ... 0x46:
      return UInt8(u - 0x41 + 10)
    case 0x61 ... 0x66:
      return UInt8(u - 0x61 + 10)
    default:
      return nil
    }
  }
  
  init?(hexString: String) {
    var str = hexString
    if str.count%2 != 0 {
      str.insert("0", at: str.startIndex)
    }
    
    let utf16 = str.utf16
    self.init(capacity: utf16.count/2)
    
    var i = utf16.startIndex
    while i != str.utf16.endIndex {
      guard let hi = decodeNibble(utf16[i]),
        let lo = decodeNibble(utf16[utf16.index(i, offsetBy: 1, limitedBy: utf16.endIndex)!]) else {
          return nil
      }
      var value = hi << 4 + lo
      self.append(&value, count: 1)
      i = utf16.index(i, offsetBy: 2, limitedBy: utf16.endIndex)!
    }
  }
}
