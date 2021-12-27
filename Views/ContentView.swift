//
//  ContentView.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 23/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSessionScreenShowing:Bool = false
    @State var isPreferenceViewShowing:Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.init(red: 31/255, green: 64/255, blue: 55/255, opacity: 1.0),Color.init(red: 153/255, green: 242/255, blue: 200/255, opacity: 1.0)], startPoint: .topLeading, endPoint: .bottomTrailing)
                ZStack {
                    Color.black
                        .opacity(0.2)
                        .blur(radius: 50)
                }
                
                VStack {
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                        Spacer()
                        Text("Last session count").font(.title)
                        Text("6 sessions").font(.title).bold()
                        Text("23/07/2005")
                        Spacer()
                        Button(action:{
                            
                        }, label: {
                            Text("View previous records ->")
                                .underline()
                        })
                        
                    }.foregroundColor(.white)
                    
                    VStack {
                        
                        NavigationLink("", destination: SessionScreen(isSessionScreenShowing: $isSessionScreenShowing), isActive: $isSessionScreenShowing)
                        
                        Spacer()
                        Button(action: {
                            isSessionScreenShowing.toggle()
                        }, label: {
                            Text("Begin session")
                                .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                                .font(.title)
                                .bold()
                                .padding(.vertical, 10.0)
                                .padding(.horizontal, 57.0)
                                .background(Color.white)
                                .cornerRadius(24.5)
                        })
                        Spacer()
                        HStack{
                            Image(systemName: "speaker.fill")
                            Spacer()
                            Button(action: {
                                isPreferenceViewShowing.toggle()
                            }, label: {
                                Image(systemName: "slider.vertical.3")
                            })
                        }
                        .foregroundColor(Color.white)
                        .font(.system(size: 35))
                        .padding(.horizontal, 20.0)
                        .padding(.bottom, 30.0)
                    }
                }.fullScreenCover(isPresented: $isPreferenceViewShowing, content: {
                    PreferencesView(isPreferencesViewShowing: $isPreferenceViewShowing).navigationBarHidden(true)
                })
            }.ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
