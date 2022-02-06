//
//  FavoritesView.swift
//  iDine
//
//  Created by Ungurean Valentina on 05.02.2022.
//

import SwiftUI

struct FavoritesView: View {
  @EnvironmentObject var favorites: Favorites
  
  var body: some View {
    NavigationView {
      List {
        ForEach(favorites.items) { item in
          ItemRow(item: item)
        }
        .onDelete(perform: deleteItems)
      }
      .navigationBarTitle("Favorites")
      .listStyle(GroupedListStyle())
      .toolbar {
        EditButton()
      }
    }
  }
  
  func deleteItems(at offsets: IndexSet) {
    favorites.items.remove(atOffsets: offsets)
  }
}

struct FavoritesView_Previews: PreviewProvider {
  static var previews: some View {
    FavoritesView()
  }
}
