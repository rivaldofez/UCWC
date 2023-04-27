//
//  HomeView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct HomeView: View {
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    private var data: [Int] = Array(1...5)
    
    var body: some View {
        GeometryReader { screen in
            VStack(alignment: .leading) {
                HStack {
                    Image("avatar_male")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Welcome!")
                        Text("Rivaldo Fernandes")
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                }
                
                Divider()
                
                Text("Select Your Cafetaria")
            
                
                Spacer()
            }
            .padding(16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
