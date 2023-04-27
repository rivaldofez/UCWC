//
//  CheckOutVIew.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 28/04/23.
//

import SwiftUI

struct CheckOutView: View {
    @State private var payAmount: String = ""
    @Binding var total: Double
    @Binding var cafeData: [Cafe]
    
    @State var showHomeView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Total Order : Rp1.000.000")
                .font(.system(.title, design: .rounded))
            
            TextField("Enter the nominal: ", text: $payAmount)
                .keyboardType(.numberPad)
            
            Button(action: {
                if let pay = Double(payAmount) {
                    if pay >= total {
                        print("berhasil checkout")
                        clearData()
                        total = 0
                        dismiss()
                    }
                }
            }) {
                Text("Checkout")
            }
            .padding(.top, 16)
            .buttonStyle(.borderedProminent)
            
        }
        .padding(32)
    }
    
    private func clearData(){
        for cafeId in 0..<cafeData.count {
            for foodId in 0..<cafeData[cafeId].food.count {
                cafeData[cafeId].food[foodId].quantity = 0
            }
        }
        
        dummyCafe = cafeData
    }
}

//struct CheckOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckOutView()
//    }
//}
