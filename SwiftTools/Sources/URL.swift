//
//  URL.swift
//  SwiftTools
//
//  Created by Jeremy Bouillanne on 05/10/2017.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation

extension URL {
  public var parameters: [String: String] {
    guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
      let queryItems = components.queryItems else {
        return [:]
    }
    
    var queryParameters = [String: String]()
    for item in queryItems {
      queryParameters[item.name] = item.value ?? ""
    }
    
    return queryParameters
  }
}
