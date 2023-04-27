//
//  CafetariaItemView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CafeItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Find out more")
                .font(.system(.title3))
                .multilineTextAlignment(.trailing)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(.black.opacity(0.7))
            
            
        }
        .frame(maxWidth: .infinity, minHeight: 200, alignment: .trailing)
        .background(
                Image("food_court")
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CafetariaItemView_Previews: PreviewProvider {
    static var previews: some View {
        CafeItemView()
    }
}