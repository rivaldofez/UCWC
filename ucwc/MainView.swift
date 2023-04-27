//
//  MainView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct MainView: View {
    @Binding var fullName: String
    
    var body: some View {
        TabView {
            HomeView(fullName: $fullName)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(fullName: .constant("Rivaldo"))
    }
}
