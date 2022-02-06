//
//  ItemDetail.swift
//  iDine
//
//  Created by Ungurean Valentina on 01.02.2022.
//

import SwiftUI

struct ItemDetail: View {
  @EnvironmentObject var order: Order
  @EnvironmentObject var favorites: Favorites
  var item: MenuItem
  
  var isFavorite: Bool {
    if $favorites.items.contains(where: {$0.id == item.id}) {
      return true
    } else {
      return false
    }
  }
  
  var body: some View {
    VStack {
      ZStack(alignment: .bottomTrailing) {
        Image(item.mainImage)
        Text("Photo: \(item.photoCredit)")
          .padding(4)
          .background(Color.black)
          .font(.caption)
          .foregroundColor(.white)
          .offset(x: -5, y: -5)
      }
      Text(item.description)
        .padding()
      Button("Order This") {
        order.add(item: item)
      }
      .padding(10)
      .background(Color.gray.opacity(0.3))
      .font(.title2)
      .cornerRadius(10)
      Spacer()
    }
    .navigationBarTitle(Text(item.name), displayMode: .inline)
    .toolbar {
      Button(action: {
        if isFavorite {
          favorites.remove(item: item)
        } else {
          favorites.add(item: item)
        }
      }) {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
      }
    }
  }
}

struct ItemDetail_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ItemDetail(item: MenuItem.example).environmentObject(Order()).environmentObject(Favorites())
    }
  }
}
