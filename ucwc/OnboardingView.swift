//
//  OnboardingView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var fullname: String = ""
    @State var showHomeView: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, What's your name?")
                .font(.system(.title, design: .rounded))
            
            TextField("Name", text: $fullname)
            
            Button(action: {
                showHomeView = true
            }) {
                Text("Continue")
            }
            .fullScreenCover(isPresented: $showHomeView) {
                NavigationView {
                    MainView()
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
