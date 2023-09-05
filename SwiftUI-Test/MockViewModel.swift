//
//  MockViewModel.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 5/9/23.
//

import Foundation
protocol MockViewModelProtocol {
    func add(a: Int, b: Int) -> Int
    func sub(a: Int, b: Int) -> Int
}

class MockViewModel: MockViewModelProtocol {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    func sub(a: Int, b: Int) -> Int {
        return a - b
    }
}
