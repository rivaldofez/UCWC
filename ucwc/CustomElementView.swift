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
