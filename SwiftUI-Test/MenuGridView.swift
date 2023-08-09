//
//  MenuGridView.swift
//  SwiftUI-Test
//
//  Created by Md. Shamiul Islam on 8/8/23.
//

import SwiftUI

struct MenuGridView: View {
    @State var menu: [MenuItem]
    @State private var favorites: [Int] = [-1]
    @Binding var selectedItem: MenuItem
    let coloumnLayout = Array(repeating: GridItem(), count: 3)
    let favColoumnLayout = Array(repeating: GridItem(), count: 5)
    @Namespace private var nspace
    
    var body: some View {
        VStack {
            LazyVGrid(columns: favColoumnLayout) {
                ForEach(favorites.sorted(), id: \.self) { item in
                    FavoriteTileView(menuItem: getMenu(id: item))
                        .matchedGeometryEffect(id: item, in: nspace)
                        .onTapGesture {
                            selectedItem = getMenu(id: item)
                        }
                        .onLongPressGesture {
                            if let index = favorites.firstIndex(where: {$0 == item}) {
                                favorites.remove(at: index)
                            }
                        }
                }
            }
            ScrollView {
                LazyVGrid(columns: coloumnLayout) {
                    ForEach(menu) { item in
                        if !favorites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .animation(.easeOut, value: favorites)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture(count: 2) {
                                    if !favorites.contains(item.id) {
                                        withAnimation(.easeInOut) {
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                        }
                    }
                }
            }
        }
        .animation(.easeOut, value: favorites)
    }
}

extension MenuGridView {
    func getMenu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu,
                     selectedItem: .constant(testMenuItem))
    }
}
