//
//  Size.swift
//  SwiftTools
//
//  Created by Jeremy Bouillanne on 04/10/2017.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation

extension CGSize {
  public func constrainedInSize(_ size: CGSize) -> CGSize {
    let xRatio = width / size.width
    let yRatio = height / size.height
    let minRatio = min(xRatio, yRatio)
    return applying(CGAffineTransform(scaleX: minRatio, y: minRatio))
  }
}
