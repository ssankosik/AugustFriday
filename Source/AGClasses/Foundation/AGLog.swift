//
//  AGLog.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGLogLevel
public enum AGLogLevel: Int {
  
  case off = 0, error, warning, info, debug, verbose
  
  public func description() -> String {
    switch self {
    case .verbose:
      return "VERBOSE"
    case .debug:
      return "DEBUG"
    case .info:
      return "INFO"
    case .warning:
      return "WARNING"
    case .error:
      return "ERROR"
    default:
      return ""
    }
    
  }
  
}



//MARK: - AGLog
open class AGLog: NSObject {
  
  fileprivate class func log(_ level: AGLogLevel, message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    let reflecting = "[\(URL(fileURLWithPath: fileName).deletingPathExtension().lastPathComponent)|\(line)|\(function)]"
    if level.rawValue <= AGLogConfiguration.shared.logLevel.rawValue {
      print("\(level.description()) \(reflecting) \(message)")
    }
  }
  
  open class func error(_ message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    log(.error, message: message, fileName: fileName, line: line, function: function)
  }
  
  open class func warning(_ message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    log(.warning, message: message, fileName: fileName, line: line, function: function)
  }
  
  open class func info(_ message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    log(.info, message: message, fileName: fileName, line: line, function: function)
  }
  
  open class func debug(_ message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    log(.debug, message: message, fileName: fileName, line: line, function: function)
  }
  
  open class func verbose(_ message: Any = "", fileName: String = #file, line: Int = #line, function: String = #function) {
    log(.verbose, message: message, fileName: fileName, line: line, function: function)
  }
  
  
}
