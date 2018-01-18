//
//  View.swift
//  SwiftTools
//
//  Created by Jeremy Bouillanne on 18/01/2018.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import UIKit

extension UIView {
  public func takeScreenshot() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(bounds.size, true, UIScreen.main.scale)
    drawHierarchy(in: bounds, afterScreenUpdates: true)
    defer {
      UIGraphicsEndImageContext()
    }
    return UIGraphicsGetImageFromCurrentImageContext()
  }
}
