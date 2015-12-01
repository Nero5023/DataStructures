//
//  Stack.swift
//  stackTest
//
//  Created by Nero Zuo on 15/11/6.
//  Copyright © 2015年 Nero. All rights reserved.
//

import Foundation

protocol StackType {
  typealias Element
  
  mutating func push(x: Element)
  
  mutating func pop() -> Element?
}

struct Stack<T>: StackType {
  typealias Element = T
  var entrys:[T]
  init(){
    entrys = []
  }
  
  func isEmpty() -> Bool {
    return entrys.isEmpty
  }
  
  func top() -> T? {
    return entrys.last
  }
  
  mutating func push(entry:T) {
    entrys.append(entry)
  }
  
  mutating func pop() -> T? {
    if entrys.isEmpty {
      return nil
    }else {
      return entrys.removeLast()
    }
  }
}
