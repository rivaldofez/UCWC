//
//  CartView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CartView: View {
    @State var showCheckOut: Bool = false
    
    @State private var cafeData: [Cafe] = [] {
        didSet {
            total = 0
            cafeData.forEach { cafe in
                cafe.food.forEach { food in
                    total += calculateTotal(quantity: food.quantity, price: food.price)
                }
            }
        }
    }
    @State private var total: Double = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if (total > 0 ){
                ScrollView {
                    ForEach(0..<cafeData.count, id: \.self) { cafeId in
                        ForEach(0..<cafeData[cafeId].food.count, id: \.self) { foodId in
                            if (cafeData[cafeId].food[foodId].quantity > 0){
                                VStack(alignment: .leading) {
                                    Text(cafeData[cafeId].food[foodId].name)
                                        .font(.system(.title3))
                                    Text("Rp\(formattedAmount(number: cafeData[cafeId].food[foodId].price))")
                                        .font(.system(.body))
                                    
                                    
                                    CartItemView(
                                        actionMinus: {
                                            if(cafeData[cafeId].food[foodId].quantity > 0){
                                                cafeData[cafeId].food[foodId].quantity -= 1
                                            }
                                    }, actionPlus: {
                                        cafeData[cafeId].food[foodId].quantity += 1
                                    }, quantity: cafeData[cafeId].food[foodId].quantity,
                                        subTotal: calculateTotal(quantity: cafeData[cafeId].food[foodId].quantity, price: cafeData[cafeId].food[foodId].price))
                                    
                                    
                                    Spacer()
                                }
                                .padding(8)
                                .background(.gray.opacity(0.4))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(16)
                                
                            }
                        }
                    }
                }
                TotalOrderView(total: total)
                
                
                CheckOutButton {
                    showCheckOut.toggle()
                }
                .sheet(isPresented: $showCheckOut) {
                    CheckOutView(total: $total, cafeData: $cafeData)
                        .presentationDetents([.medium, .large])
                }
                
            } else {
                Text("You don't order food yet. Check out our amazing food and order it")
                    .font(.system(.title2))
                    .multilineTextAlignment(.center)
                
            }
        }.onAppear {
            self.cafeData = dummyCafe
        }
    }
    
    private func formattedAmount(number: Double) -> String {
        return number.formatted(FloatingPointFormatStyle())
    }
    
    
    private func calculateTotal(quantity: Int?, price: Double?) -> Double {
        if let quantity = quantity, let price = price {
            return price * Double(quantity)
            
        } else { return 0 }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
