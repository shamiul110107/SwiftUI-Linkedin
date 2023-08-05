//
//  RatingsView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 13/7/23.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { circle in
                Image(systemName: circle <= rating ? "fork.knife.circle.fill": "circle")
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: 5)
    }
}
