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
    @State var selectedItem: MenuItem = noMenuItem
    let coloumnLayout = Array(repeating: GridItem(), count: 3)
    let favColoumnLayout = Array(repeating: GridItem(), count: 5)
    
    
    var body: some View {
        VStack {
            LazyVGrid(columns: favColoumnLayout) {
                ForEach(favorites.sorted(), id: \.self) { item in
                    FavoriteTileView(menuItem: getMenu(id: item))
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
                                .onTapGesture(count: 2) {
                                    if !favorites.contains(item.id) {
                                        favorites.append(item.id)
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
    }
}

extension MenuGridView {
    func getMenu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu)
    }
}
