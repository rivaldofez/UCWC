//
//  CartView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CartView: View {
    @State private var cartData: [Cart] = []
    
    var body: some View {
        VStack {
            Text("Your Order:")
            
            ScrollView {
                ForEach(cartData, id: \.foodName) { cart in
                    Text(cart.foodName)
                }
            }
            
        }.onAppear {
            self.cartData = dummyCartData
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
