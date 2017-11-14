//
//  Delay.swift
//  DispatchQueue
//
//  Created by Jeremy Bouillanne on 14/11/2017.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation

extension DispatchQueue {
  public func delay(_ delay: Double, action: @escaping () -> ()) {
    asyncAfter(
      deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
      execute: action
    )
  }
}
