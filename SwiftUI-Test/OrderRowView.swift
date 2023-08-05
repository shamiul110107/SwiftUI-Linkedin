//
//  OrderRowView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 12/7/23.
//

import SwiftUI

struct OrderRowView: View {
    var order: Int
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Your Order Item \(order)")
                Spacer()
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text(1, format: .number)
                Text(19.90, format: .currency(code: "USD"))
                Spacer()
                Text(19.90, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }

        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: 1)
    }
}
