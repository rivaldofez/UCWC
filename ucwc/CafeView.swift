//
//  CafeView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CafeView: View {
    var cafe: Cafe
    @State var isFoodSelected = false
    @State var selectedFood: Food? = nil
    @State var numOfBuy: Int = 0
    
    private let foodColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        VStack {
            Text(cafe.name)
                .font(.system(.title))
                .foregroundColor(.primary)
            
            ScrollView {
                LazyVGrid(columns: foodColumns) {
                    ForEach(cafe.food, id: \.id){ food in
                        FoodItemView(foodName: food.name)
                            .onTapGesture {
                                isFoodSelected = !isFoodSelected
                                
                                if isFoodSelected {
                                    selectedFood = food
                                } else {
                                    selectedFood = nil
                                }
                            }
                        
                    }
                }
            }
            
            if isFoodSelected {
                VStack(alignment: .center) {
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text(selectedFood?.name ?? "")
                            .font(.system(.title3))
                        Text("Rp\(selectedFood?.price.formatted(FloatingPointFormatStyle()) ?? "") / 300 liter")
                            .font(.system(.title2).bold())
                    }
                    
                    HStack {
                        
                        HStack {
                            Button(action: {
                                if numOfBuy <= 0 {
                                    numOfBuy = 0
                                } else {
                                    numOfBuy = numOfBuy - 1
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
                            Text("\(numOfBuy)")
                                .padding(.horizontal, 10)
                                .font(.system(.title3).bold())
                            Button(action: {
                                numOfBuy = numOfBuy + 1
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
                        
                        
                        Text("Total : \(calculateTotal(quantity: numOfBuy, price: selectedFood?.price).formatted(FloatingPointFormatStyle()))")
                            .font(.system(.title3).bold())
                        
                    }.padding(.horizontal, 16)
                    
                    Button(action: {}) {
                        Text("Add To Cart")
                    }
                    .disabled(numOfBuy <= 0)
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
        CafeView(cafe: dummyCafe[0], isFoodSelected: true)
    }
}
