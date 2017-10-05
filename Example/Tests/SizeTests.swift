//
//  SizeTests.swift
//  SwiftTools_Tests
//
//  Created by Jeremy Bouillanne on 05/10/2017.
//  Copyright © 2017 Jeremy Bouillanne. All rights reserved.
//

import Foundation
import XCTest
import Pods_SwiftTools_Tests

class SizeTests: XCTestCase {
  
  let targetSize = CGSize(width: 150, height: 100)
  
  func isConstrained(_ size: CGSize) -> Bool {
    return size.width <= targetSize.width && size.height <= targetSize.height
  }

  //MARK: - Tests
  
  func testSmallerLandscapeSizeIsConstrained() {
    let size = CGSize(width: 50, height: 20)
    let constrainedSize = size.constrainedInSize(targetSize)
    XCTAssert(isConstrained(constrainedSize), "Constrained size shouldn't be larger than target size")
  }
  
  func testSmallerPortraitSizeIsConstrained() {
    let size = CGSize(width: 20, height: 50)
    let constrainedSize = size.constrainedInSize(targetSize)
    XCTAssert(isConstrained(constrainedSize), "Constrained size shouldn't be larger than target size")
  }
  
  func testLargerLandscapeSizeIsConstrained() {
    let size = CGSize(width: 200, height: 50)
    let constrainedSize = size.constrainedInSize(targetSize)
    XCTAssert(isConstrained(constrainedSize), "Constrained size shouldn't be larger than target size")
  }

  func testLargerPortraitSizeIsConstrained() {
    let size = CGSize(width: 80, height: 120)
    let constrainedSize = size.constrainedInSize(targetSize)
    XCTAssert(isConstrained(constrainedSize), "Constrained size shouldn't be larger than target size")
  }
  
  func testZeroSizeReturnsItself() {
    let size = CGSize.zero
    let constrainedSize = size.constrainedInSize(targetSize)
    XCTAssert(size == constrainedSize, "Zero size should return itself")
  }
}
