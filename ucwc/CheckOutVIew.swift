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
    @State var showAlert: Bool = false
    
    @State var showHomeView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Total Order : Rp\(total.formatted(FloatingPointFormatStyle()))")
                .font(.system(.title, design: .rounded))
            
            TextField("Enter the nominal: ", text: $payAmount)
                .keyboardType(.numberPad)
            
            HStack {
                Spacer()
                Button(action: {
                    if let pay = Double(payAmount) {
                        if pay >= total {
                            print("berhasil checkout")
                            showAlert = true
                            
                            
                        }
                    }
                }) {
                    Text("Checkout")
                }
                .padding(.top, 16)
                .buttonStyle(.borderedProminent)
                .disabled((moneyBack(total: total, payAmount: Double(payAmount)) < 0 || payAmount.isEmpty))
                .alert(
                    moneyBack(total: total, payAmount: Double(payAmount)) > 0 ? "Successfully checkout, here's your money back \(moneyBack(total: total, payAmount: Double(payAmount)).formatted(FloatingPointFormatStyle()))" : "Successfully Checkout"
                    
                    , isPresented: $showAlert) {
                            Button("OK", role: .cancel) {
                                clearData()
                                total = 0
                                dismiss()
                            }
                        }
                Spacer()
            }
            
        }
        .padding(32)
    }
    
    private func moneyBack(total: Double?, payAmount: Double?) -> Double {
        if let total = total, let payAmount = payAmount {
            return payAmount - total
        } else {
            return 0
        }
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
