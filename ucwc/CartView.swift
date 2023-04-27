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
                    total = total + calculateTotal(quantity: food.quantity, price: food.price)
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
                                    Text("Rp\(cafeData[cafeId].food[foodId].price.formatted(FloatingPointFormatStyle()))")
                                        .font(.system(.body))
                                    
                                    HStack {
                                        Button(action: {
                                            if(cafeData[cafeId].food[foodId].quantity > 0){
                                                cafeData[cafeId].food[foodId].quantity  = cafeData[cafeId].food[foodId].quantity - 1
                                            }
                                            
                                        }) {
                                            Image(systemName: "minus")
                                                .font(.system(.body))
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.black)
                                                .padding(10)
                                                .background(.gray)
                                                .clipShape(Circle())
                                        }
                                        Text("\(cafeData[cafeId].food[foodId].quantity)")
                                            .padding(.horizontal, 10)
                                            .font(.system(.title3).bold())
                                        Button(action: {
                                            cafeData[cafeId].food[foodId].quantity = cafeData[cafeId].food[foodId].quantity + 1
                                        }) {
                                            Image(systemName: "plus")
                                                .font(.system(.body))
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.black)
                                                .padding(10)
                                                .background(.gray)
                                                .clipShape(Circle())
                                        }
                                        
                                        Spacer()
                                        
                                        Text("Subtotal : Rp\(calculateTotal(quantity: cafeData[cafeId].food[foodId].quantity, price: cafeData[cafeId].food[foodId].price).formatted(FloatingPointFormatStyle()))")
                                            .font(.system(.title3).bold())
                                    }
                                    Spacer()
                                }
                                .padding(8)
                                .background(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(16)
                                
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Total Order :")
                        .font(.system(.title3).bold())
                    Spacer()
                    Text("Rp\(total.formatted(FloatingPointFormatStyle()))")
                        .font(.system(.title3).bold())
                    
                }.padding(.horizontal, 16)
                
                HStack {
                    Spacer()
                    Button(action: {
                        showCheckOut.toggle()
                    }) {
                        Text("Check Out")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showCheckOut) {
                        CheckOutView(total: $total, cafeData: $cafeData)
                            .presentationDetents([.medium, .large])
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
            } else {
                Text("You don't order food yet. Check out our amazing food and order it")
                    .font(.system(.title2))
                    .multilineTextAlignment(.center)
                
            }
        }.onAppear {
            self.cafeData = dummyCafe
        }
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
