//
//  AGDefaultsFoundation.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDefaultsFoundation
protocol AGDefaultsFoundation {
  associatedtype T
  static var key: String { get }
  static func get() -> T?
  static func set(data: T)
  static func remove()
}



//MARK: - Implements
extension AGDefaultsFoundation {
  
  static func get() -> T? {
    let ud = UserDefaults.standard
    return ud.object(forKey: key) as? T
  }
  
  static func set(data: T) {
    let ud = UserDefaults.standard
    ud.set(data, forKey: key)
  }
  
  static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}


