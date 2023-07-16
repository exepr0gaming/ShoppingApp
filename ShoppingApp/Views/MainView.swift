//
//  MainView.swift
//  ShoppingApp
//
//  Created by Admin on 15.07.2023.
//

import SwiftUI

struct MainView: View {
  @StateObject var cartManager = CartManager()
  var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(productList, id: \.id) { product in
            ProductCard(product: product)
              .environmentObject(cartManager)
          }
        }
        .padding()
      }
      .navigationTitle(Text("Sweater Shop"))
      .toolbar {
        NavigationLink {
          CartView()
            .environmentObject(cartManager)
        } label: {
          CartButton(numberOfProducts: cartManager.products.count)
        }
        
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
