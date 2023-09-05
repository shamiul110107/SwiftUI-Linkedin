//
//  HeaderViewTests.swift
//  SwiftUI-TestTests
//
//  Created by Md. Shamiul Islam on 5/9/23.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftUI_Test

final class HeaderViewTests: XCTestCase {

    func testHeaderView() throws {
        var orderModel = OrderModel()
        orderModel.orderItems = testOrders
        
        XCTAssertNotNil(orderModel.orderItems)
        print(orderModel.orderItems.count)
        let view = HeaderView()
            .environmentObject(orderModel) // Provide necessary dependencies here

        // Use ViewInspector to inspect and verify the view's hierarchy and properties
        let zStack = try view.inspect().vStack().zStack(0)
        XCTAssertNotNil(zStack)
        XCTAssertNoThrow(try zStack.image(0)) // Verify the presence of the image
        XCTAssertEqual(try zStack.text(1).string(), "Hulia pizza company") // Verify the text content
    }

}
