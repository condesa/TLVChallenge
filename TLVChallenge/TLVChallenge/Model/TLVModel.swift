//
//  TLVModel.swift
//  TLVChallenge
//
//  Created by Aurora Rodríguez on 9/3/18.
//  Copyright © 2018 Aurora Rodríguez. All rights reserved.
//

import Foundation

class EMVTag {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class TLVModel: NSObject {
  var tag: Data
  var length: Int
  var value: Data
  var isConstructed: Bool
  var children = [TLVModel]()
  
  var displayTag: String {
    return tag.map { ("0" + String($0, radix: 16)).suffix(2) }.joined()
  }
  
  var displayMeaning: String {
    return getEmvTag(code: displayTag.uppercased()).name
  }
  
  var displayValue: String {
    let hexValues = value.map { ("0" + String($0, radix: 16)).suffix(2) }
    var str = ""
    for (_, hex) in hexValues.enumerated() {
      str += hex
    }
    if length > 6 {
      if let data = Data.init(hexString: str.uppercased()) {
        if let result = String.init(data: data, encoding: .utf8) {
          return result.uppercased()
        }
      }
    }
    return str.uppercased()
  }
  
  convenience init?(dataStream: Data) {
    var size = 0
    self.init(dataStream: dataStream, offset: 0, size: &size)
  }
  
  static func create(from dataStream: Data) -> [TLVModel] {
    var size = 0
    var offset = 0
    var nodes = [TLVModel]()
    
    while let node = TLVModel(dataStream: dataStream, offset: offset, size: &size) {
      nodes.append(node)
      offset += size
    }
    return nodes
  }
  
  private init?(dataStream: Data, offset: Int, size: inout Int) {
    guard offset < dataStream.count - 3 else { return nil }
    let m = dataStream[offset] & 0x1F == 0x1F ?
      2 + dataStream[(offset + 1)...].prefix(10).prefix(while: { $0 & 0x80 == 0x80 }).count : 1
    
    guard offset + m < dataStream.count else { return nil }
    
    let n = dataStream[offset + m] & 0x80 == 0x80 ? Int(dataStream[offset + m] & 0x7f) : 1
    guard n <= 3 else { return nil }
    guard offset + m + n < dataStream.count else { return nil }
    
    self.tag = Data(dataStream[offset ..< (offset + m)])
    self.length = dataStream[(offset + m) ..< (offset + m + n)].map { Int($0) }.reduce(0) { result, element in result * 0x100 + element }
    
    guard offset + m + n + length <= dataStream.count else {
      print("offset + m + n + length = \(offset + m + n + length)")
      return nil }
    
    self.value = Data(dataStream[(offset + m + n) ..< (offset + m + n + length)])
    self.isConstructed = dataStream[offset] & 0x20 == 0x20
    
    size = m + n + length
    if self.isConstructed {
      var childOffset = 0
      var childNodeSize = 0
      
      while let childNode = TLVModel(dataStream: self.value, offset: childOffset, size: &childNodeSize) {
        self.children.append(childNode)
        childOffset += childNodeSize
      }
    }
  }
}
