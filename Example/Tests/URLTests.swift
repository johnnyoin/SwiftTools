//
//  URLTests.swift
//  SwiftTools_Tests
//
//  Created by Jeremy Bouillanne on 05/10/2017.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation
import XCTest

class URLTests: XCTestCase {
  
  let url = URL(string: "xxx://nani?po&pu=12")!
  
  func testParametersCanBeNil() {
    XCTAssertNotNil(url.parameters["po"], "Empty parameters should be returned")
  }
  
  func testParametersHasValue() {
    XCTAssert(url.parameters["pu"] == "12", "Parameters should have right value")
  }
  
}
