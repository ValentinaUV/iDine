//
//  iDineApp.swift
//  iDine
//
//  Created by Ungurean Valentina on 01.02.2022.
//

import SwiftUI

@main
struct iDineApp: App {
  @StateObject var order = Order()
  @StateObject var favorites = Favorites()
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(order)
        .environmentObject(favorites)
    }
  }
}
