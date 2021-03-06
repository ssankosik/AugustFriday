//
//  URL+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/8/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



public extension URL {
  
  public func value(of name: String) -> String? {
    guard let url = URLComponents(string: self.absoluteString) else { return nil }
    return url.queryItems?.first(where: { $0.name == name })?.value
    
  }
  
}
