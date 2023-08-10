//
//  ContentView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders = false
    @State private var selectedItem: MenuItem = noMenuItem
    @State private var presentGrid: Bool = false
    
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
            if showOrders {
                OrderView(orders: orders).cornerRadius(10)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial,
                                in: RoundedRectangle(cornerRadius: 10))
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else {
                    MenuView(menu: menu, selectedItem: $selectedItem)
                }
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
    }
}
