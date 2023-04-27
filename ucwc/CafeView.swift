//
//  CafeView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CafeView: View {
    var cafeId: Int
    @State var isFoodSelected = false
    @State var selectedFood: Int = 0
    @State var quantity: Int = 0
    
    private let foodColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        VStack {
            Text(dummyCafe[cafeId].name)
                .font(.system(.title))
                .foregroundColor(.primary)
            
            ScrollView {
                LazyVGrid(columns: foodColumns) {
                    ForEach(0..<dummyCafe[cafeId].food.count, id: \.self){ foodId in
                        FoodItemView(foodName: dummyCafe[cafeId].food[foodId].name)
                            .onTapGesture {
                                
                                if selectedFood != foodId {
                                    isFoodSelected = true
                                } else {
                                    isFoodSelected = !isFoodSelected
                                }
                                
                                
                                
                                if isFoodSelected {
                                    selectedFood = foodId
                                    quantity = 0
                                } else {
                                    selectedFood = 0
                                }
                            }
                        
                    }
                }
            }
            
            if isFoodSelected {
                VStack(alignment: .center) {
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text(dummyCafe[cafeId].food[selectedFood].name)
                            .font(.system(.title3))
                        Text("Rp\(dummyCafe[cafeId].food[selectedFood].price.formatted(FloatingPointFormatStyle()) ) / 300 liter")
                            .font(.system(.title2).bold())
                    }
                    
                    HStack {
                        
                        HStack {
                            Button(action: {
                                if quantity <= 0 {
                                    quantity = 0
                                } else {
                                    quantity = quantity - 1
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
                            Text("\(quantity)")
                                .padding(.horizontal, 10)
                                .font(.system(.title3).bold())
                            Button(action: {
                                quantity = quantity + 1
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(.body))
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(.gray)
                                    .clipShape(Circle())
                            }
                        }
                        
                        Spacer()
                        
                        
                        Text("Total : \(calculateTotal(quantity: quantity, price: dummyCafe[cafeId].food[selectedFood].price).formatted(FloatingPointFormatStyle()))")
                            .font(.system(.title3).bold())
                        
                    }.padding(.horizontal, 16)
                    
                    Button(action: {
                        dummyCafe[cafeId].food[selectedFood].quantity = self.quantity
                        
                    }) {
                        Text("Add To Cart")
                    }
                    .disabled(quantity <= 0)
                    .buttonStyle(.borderedProminent)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
                .padding(.horizontal, 16)
                .background(.black.opacity(0.15))
                
            }
        }
    }
    
     
    private func calculateTotal(quantity: Int?, price: Double?) -> Double {
        if let quantity = quantity, let price = price {
            return price * Double(quantity)
            
        } else { return 0 }
    }
}

struct CafeView_Previews: PreviewProvider {
    static var previews: some View {
        CafeView(cafeId: 0)
    }
}
