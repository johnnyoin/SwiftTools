//
//  Color.swift
//  SwiftTools
//
//  Created by Jeremy Bouillanne on 16/09/16.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(hex: UInt32) {
    let red   = CGFloat((hex >> 16) & 0xff) / 255.0
    let green = CGFloat((hex >>  8) & 0xff) / 255.0
    let blue  = CGFloat((hex      ) & 0xff) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: 1)
  }
  
  public func translucent(alpha: CGFloat = 0.5) -> UIColor {
    return self.withAlphaComponent(alpha)
  }
  
  public func lighter() -> UIColor {
    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
      return UIColor(hue: h,
                     saturation: s,
                     brightness: b * 1.2,
                     alpha: a)
    }
    
    return self
  }
  
  public func darker() -> UIColor {
    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
      return UIColor(hue: h,
                     saturation: s,
                     brightness: b * 0.75,
                     alpha: a)
    }
    
    return self
  }
  
  public func convertedForNavBar() -> UIColor {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    // any R, G or B value under 40 will be negative once converted...
    let convertedColors = [red, green, blue].map { convertedColor($0) }
    
    // ...therefore capped to 0
    return UIColor(red: convertedColors[0], green: convertedColors[1], blue: convertedColors[2], alpha: alpha)
  }
  
  private func convertedColor(_ channel: CGFloat) -> CGFloat {
    return (channel * 255 - 40) / (1 - 40 / 255) / 255
  }
  
}

