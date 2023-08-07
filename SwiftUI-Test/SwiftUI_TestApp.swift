//
//  SwiftUI_TestApp.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 11/7/23.
//

import SwiftUI

@main
struct SwiftUI_TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}
