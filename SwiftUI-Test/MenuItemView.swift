//
//  MenuItemView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 12/7/23.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addItem = false
    var body: some View {
        VStack {
            HStack {
                Text("Margherita Huli Pizza")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                    //.frame(minWidth: 150, maxWidth: 1000, maxHeight: 300)
                if let image = UIImage(named: "0_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top, .bottom], 5)
                        .cornerRadius(15)
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in: Capsule())
            .shadow(color: .teal, radius: 5, x: 8, y: 8)

            VStack (alignment: .leading) {
                ScrollView {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis finibus tortor, eu volutpat ligula. Curabitur quis felis at libero consequat tristique ut eget lorem. Vivamus vel aliquet lectus. Vivamus a hendrerit ex. Vestibulum pharetra dui ipsum. Curabitur eget tristique nisi, at efficitur orci. Morbi ac accumsan enim. Quisque tincidunt.")
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }

            }.padding(5)
            
            Button {
                addItem.toggle()
            } label: {
                Spacer()
                Text(12.99, format: .currency(code: "USD"))
                Image(systemName: addItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .padding()
            .background(.red, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
