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
        VStack(alignment: .leading) {
            Text("Select Your Food :")
                .font(.system(.title3))
                .foregroundColor(.primary)
                .padding(.top, 32)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
            
            ScrollView {
                LazyVGrid(columns: foodColumns) {
                    ForEach(0..<dummyCafe[cafeId].food.count, id: \.self){ foodId in
                        FoodItemView(foodName: dummyCafe[cafeId].food[foodId].name, foodThumbnail: dummyCafe[cafeId].food[foodId].image )
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
                        Text("Rp\(dummyCafe[cafeId].food[selectedFood].price.formatted(FloatingPointFormatStyle()))")
                            .font(.system(.title2).bold())
                    }
                    
                    HStack {
                        
                        CartItemView(
                            actionMinus: {
                                if quantity <= 0 {
                                    quantity = 0
                                } else {
                                    quantity = quantity - 1
                                }
                            }
                            , actionPlus: {
                                quantity = quantity + 1
                            }
                            , quantity: quantity,
                            subTotal: calculateTotal(quantity: quantity, price: dummyCafe[cafeId].food[selectedFood].price))
                        
                        
                        
                        Spacer()
                        
                       
                        
                    }.padding(.horizontal, 16)
                    
                    Button(action: {
                        dummyCafe[cafeId].food[selectedFood].quantity = self.quantity
                        isFoodSelected = false
                        
                    }) {
                        Text("Add To Cart")
                        
                    }
                    .disabled(quantity <= 0)
                    .buttonStyle(.borderedProminent)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
                .background(.gray.opacity(0.05))
                
            }
                
        }
        .navigationTitle(dummyCafe[cafeId].name)
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
