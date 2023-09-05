//
//  MockViewModelTests.swift
//  SwiftUI-TestTests
//
//  Created by Md. Shamiul Islam on 5/9/23.
//

import XCTest
import SwiftUI
@testable import SwiftUI_Test

final class MockViewModelTests: XCTestCase {
    var sut = MockViewModel()
    
    func testAddition() {
        let viewModel: MockViewModelProtocol = MockViewModel()
        let a = 5
        let b = 3
        
        // Act
        let result = viewModel.add(a: a, b: b)
        
        // Assert
        XCTAssertEqual(result, 8, "Addition result is incorrect")
    }
    func testSubtraction() {
        // Arrange
        let viewModel: MockViewModelProtocol = MockViewModel()
        let a = 10
        let b = 4
        
        // Act
        let result = viewModel.sub(a: a, b: b)
        
        // Assert
        XCTAssertEqual(result, 6, "Subtraction result is incorrect")
    }
}
