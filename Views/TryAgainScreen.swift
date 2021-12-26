//
//  TryAgainScreen.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 25/12/2021.
//

import SwiftUI

struct TryAgainScreen: View {
    
    @Binding var isShowingScreen: Bool
    @State var isShowingContentView:Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                    .opacity(0.1)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Group{
                        Text("Session ended").font(.title2).padding(.bottom)
                        Text("Wanna go again?")
                            .font(.title)
                            .bold()
                    }.foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                    Spacer()
                    Button(action: {
                        isShowingScreen.toggle()
                    }, label: {
                        Text("Yes")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.vertical, 15.0)
                            .padding(.horizontal, 40.0)
                            .background(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                            .cornerRadius(20.0)
                    })
                    Spacer()
                    NavigationLink("", destination: ContentView().navigationBarHidden(true), isActive: $isShowingContentView)
                    Button(action:{
                        isShowingContentView.toggle()
                    }, label: {
                        Text("End session")
                            .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                            .underline()
                            .font(.title2)
                    }).padding(.bottom, 40.0)
                }
            }
        }
    }
}

struct TryAgainScreen_Previews: PreviewProvider {
    static var previews: some View {
        TryAgainScreen(isShowingScreen: Binding.constant(true))
    }
}
