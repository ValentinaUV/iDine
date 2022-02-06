//
//  MainView.swift
//  iDine
//
//  Created by Ungurean Valentina on 05.02.2022.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
          Label("Menu", systemImage: "list.dash")
        }
      OrderView()
        .tabItem {
          Label("Order", systemImage: "square.and.pencil")
        }
      FavoritesView()
        .tabItem {
          Label("Favorites", systemImage: "heart")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView().environmentObject(Order())
  }
}
