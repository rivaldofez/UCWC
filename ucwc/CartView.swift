//
//  CartView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CartView: View {
    @State private var cafeData: [Cafe] = []
    
    var body: some View {
        VStack {
            Text("Your Order:")
            
            ScrollView {
                ForEach(0..<cafeData.count, id: \.self) { cafeId in
                    ForEach(0..<cafeData[cafeId].food.count, id: \.self) { foodId in
                        if (cafeData[cafeId].food[foodId].quantity > 0){
                            Text(cafeData[cafeId].food[foodId].name)
                        }
                    }
                }
            }
            
        }.onAppear {
            self.cafeData = dummyCafe
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
