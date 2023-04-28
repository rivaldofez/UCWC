//
//  CustomElementView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 28/04/23.
//

import Foundation

import SwiftUI


struct ActionButton: View {
    var iconName: String
    var action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.system(.body))
                .frame(width: 10, height: 10)
                .foregroundColor(.black)
                .padding(10)
                .background(.gray)
                .clipShape(Circle())
        }
    }
}


struct CheckOutButton: View {
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action : action) {
                Text("Check Out")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding(.bottom, 16)
    }
}


struct TotalOrderView: View {
    var total: Double
    
    var body: some View {
        HStack {
            Text("Total Order :")
                .font(.system(.title3).bold())
            Spacer()
            Text("Rp\(total.formatted(FloatingPointFormatStyle()))")
                .font(.system(.title3).bold())
            
        }.padding(.horizontal, 16)
    }
}


struct CartItemView: View {
    var actionMinus: () -> Void
    var actionPlus: () -> Void
    var quantity: Int
    var subTotal: Double
    
    var body: some View {
        HStack {
            ActionButton(iconName: "minus", action: actionMinus)
            
            Text("\(quantity)")
                .padding(.horizontal, 10)
                .font(.system(.title3).bold())
            
            ActionButton(iconName: "plus", action: actionPlus)
            
            Spacer()
            
            Text("Subtotal : Rp\(subTotal.formatted(FloatingPointFormatStyle()))")
                .font(.system(.title3).bold())
        }
    }
}
