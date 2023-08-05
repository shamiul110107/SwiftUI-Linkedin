//
//  HeaderView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 12/7/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("surfBanner")
            .resizable()
            .scaledToFit()
            //.scaledToFill()
            .ignoresSafeArea()
            Text("Hulia pizza company")
                .font(.custom("Georgia", size: 30, relativeTo: .title))
                .foregroundStyle(.regularMaterial)
                .fontWeight(.semibold)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
