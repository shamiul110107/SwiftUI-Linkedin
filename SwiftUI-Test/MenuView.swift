//
//  MenuView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 12/7/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView {
            ForEach(1...25, id: \.self) { item in
                MenuRowView(item: item)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
