//
//  AGUtilValidator.swift
//  AugustFriday
//
//  Created by Sasawat Sankosik on 6/12/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import Foundation



public extension AGUtil.Validator {
  
  public class Phone: AGValidatorPhone { }
  public class Citizen: AGValidatorCitizen { }
  public class Email: AGValidatorEmail { }
  public class Password: AGValidatorPassword { }
  
}



public protocol AGValidator {
  static func isNumberic(string: String) -> Bool
  static func isBlank(string: String) -> Bool
  static func isNumeric(string: String) -> Bool
  static func isAlphanumeric(string: String) -> Bool
}



extension AGValidator {
  
  public static func isNumberic(string: String) -> Bool {
    if let _ = Int(string) {
      return true
    }
    return false
  }
  
  public static func isBlank(string: String) -> Bool {
    let trimmed = string.trimmingCharacters(in: CharacterSet.whitespaces)
    return trimmed.isEmpty
  }
  
  public static func isNumeric(string: String) -> Bool {
    let scanner = Scanner(string: string)
    scanner.locale = Locale.current
    return scanner.scanDecimal(nil) && scanner.isAtEnd
  }
  
  public static func isAlphanumeric(string: String) -> Bool {
    return !string.isEmpty && string.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
  }
  
}



public protocol AGValidatorPhone {
  static func isPhoneNumber(string: String) -> Bool
}



extension AGValidatorPhone {
  
  public static func isPhoneNumber(string: String) -> Bool {
    do {
      let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
      let matches = detector.matches(in: string, options: [], range: NSMakeRange(0, string.count))
      if let res = matches.first {
        return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == string.count && string.count == 10
      } else {
        return false
      }
    } catch {
      return false
    }
  }
  
}



public protocol AGValidatorCitizen {
  static func isCitizenId(string: String) -> Bool
}



extension AGValidatorCitizen {
  
  public static func isCitizenId(string: String) -> Bool {
    guard string.count == 13, AGUtil.Validator.isNumeric(string: string) else {
      return false
    }
    var sum:Int = 0
    for i in 0..<12 {
      let index = string.index(string.startIndex, offsetBy: i)
      guard let r = Int(String(string[index])) else { return false }
      sum += (r * (13-i))
    }
    let index = string.index(string.startIndex, offsetBy: 12)
    guard let last = Int(String(string[index])) else { return false }
    if ((11 - sum % 11) % 10 != last) {
      return false
    }
    return true
  }
  
}



public protocol AGValidatorEmail {
  static func isEmail(_ string: String) -> Bool
}



extension AGValidatorEmail {
  public static func isEmail(_ string: String) -> Bool {
    do {
      let regex = try NSRegularExpression(pattern: "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$", options: .caseInsensitive)
      return regex.firstMatch(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, string.count)) != nil
    } catch {
      return false
    }
  }
  
}



public protocol AGValidatorPassword {
  static func isValidPassword(string: String) -> Bool
}



extension AGValidatorPassword {
  
  public static func isValidPassword(string: String) -> Bool {
    do {
      let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
      if (regex.firstMatch(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, string.count)) != nil) {
        if (string.count >= 6 && string.count <= 20) {
          return true
        } else {
          return false
        }
      } else{
        return false
      }
    } catch {
      return false
    }
  }
  
}


