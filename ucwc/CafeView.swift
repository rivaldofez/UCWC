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
                        Text("Rp\(selectedFood?.price.formatted(FloatingPointFormatStyle()) ?? "")")
                            .font(.system(.title2).bold())
                    }
                    
                    HStack {
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "minus")
                                    .font(.system(.body))
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(.gray)
                                    .clipShape(Circle())
                            }
                            Text("10")
                                .padding(.horizontal, 10)
                                .font(.system(.title3).bold())
                            Button(action: {}) {
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
                        
                        
                        Button(action: {}) {
                            Text("Add To Cart")
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }.padding(.horizontal, 16)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
                .padding(.horizontal, 16)
                .background(.black.opacity(0.15))
                
            }
            
            
            
            
        }
    }
}

struct CafeView_Previews: PreviewProvider {
    static var previews: some View {
        CafeView(cafe: dummyCafe[0], isFoodSelected: true)
    }
}
