//
//  CafeView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct CafeView: View {
    @State var cafeName: String = ""
    
    
    var body: some View {
        VStack {
            Text("Kopi Kenangan")
                .font(.system(.title))
                .foregroundColor(.primary)
            
            
        }
    }
}

struct CafeView_Previews: PreviewProvider {
    static var previews: some View {
        CafeView()
    }
}
