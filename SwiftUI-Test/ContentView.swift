//
//  ContentView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @State private var orders: [OrderItem] = testOrders
    @State private var showOrders = false
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            HStack {
                Text("\(orders.count) Orders")
                Spacer()
                Button {
                    showOrders.toggle()
                } label: {
                    Image(systemName: showOrders ? "cart": "menucard")
                }
            }
            .font(.title2)
            .foregroundStyle(.white)

            if showOrders {
                OrderView(orders: $orders)
                    .cornerRadius(10)
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial,
                                in: RoundedRectangle(cornerRadius: 10))
                MenuView(menu: menu)
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
    }
}
