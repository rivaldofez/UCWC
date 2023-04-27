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
        GeometryReader { screen in
            VStack(alignment: .leading) {
                Image("onboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: screen.size.height / 2)
                
                
                Text("Hello, What's your name?")
                    .font(.system(.title, design: .rounded))
                
                TextField("Name", text: $fullname)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showHomeView = true
                    }) {
                        Text("Continue")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 32)
                    .disabled(fullname.isEmpty)
                    .fullScreenCover(isPresented: $showHomeView) {
                        NavigationView {
                            MainView()
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(32)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
