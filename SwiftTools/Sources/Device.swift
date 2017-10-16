//
//  Device.swift
//  SwiftTools
//
//  Created by Jeremy Bouillanne on 16/10/16.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation

public enum DeviceType {
  /// iPhone4, iPhone4s
  case iPhone4
  /// iPhone5, iPhone5s, iPhone5c, iPhoneSE
  case iPhone5
  /// iPhone6, iPhone7, iPhone8
  case iPhone6
  /// iPhone6+, iPhone7+, iPhone8+
  case iPhone6Plus
  case iPhoneX
  /// iPad mini and all others but pros
  case iPad
  /// iPad Pro 10.5"
  case iPadPro10
  /// iPad Pro 12.9"
  case iPadPro12
  case AppleTV
  case AppleTV4K
  case Other
}

extension UIDevice  {
  
  public var isIPad: Bool {
    return userInterfaceIdiom == .pad
  }

  public var type: DeviceType {
    switch userInterfaceIdiom {
    case .phone:
      return iPhoneType
    case .pad:
      return iPadType
    case .tv:
      return appleTVType
    default:
      return .Other
    }
  }
  
  var maxScreenSide: CGFloat {
    return max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
  }
  
  var iPhoneType: DeviceType {
    switch maxScreenSide {
    case 480:
      return .iPhone4
    case 568:
      return .iPhone5
    case 667:
      return .iPhone6
    case 736:
      return .iPhone6Plus
    default:
      return .iPhoneX
    }
  }
  
  var iPadType: DeviceType {
    switch maxScreenSide {
    case 1024:
      return .iPad
    case 1112:
      return .iPadPro10
    default:
      return .iPadPro12
    }
  }
  
  var appleTVType: DeviceType {
    return UIScreen.main.scale > 1 ? .AppleTV4K : .AppleTV
  }
  
  public var modelName: String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    switch identifier {
    case "iPod5,1":                                 return "iPod Touch 5"
    case "iPod7,1":                                 return "iPod Touch 6"
    case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
    case "iPhone4,1":                               return "iPhone 4s"
    case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
    case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
    case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
    case "iPhone7,2":                               return "iPhone 6"
    case "iPhone7,1":                               return "iPhone 6 Plus"
    case "iPhone8,1":                               return "iPhone 6s"
    case "iPhone8,2":                               return "iPhone 6s Plus"
    case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
    case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
    case "iPhone8,4":                               return "iPhone SE"
    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
    case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
    case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
    case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
    case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
    case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
    case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
    case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
    case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
    case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
    case "AppleTV5,3":                              return "Apple TV"
    case "i386", "x86_64":                          return "Simulator"
    default:                                        return identifier
    }
  }


}
