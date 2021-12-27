//
//  PreferencesView.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 26/12/2021.
//

import SwiftUI

struct PreferencesView: View {
    
    @State var audioMute:Bool = false
    @State var backgroundMusic: String = "Amazon"
    
    @Binding var isPreferencesViewShowing:Bool
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPreferencesViewShowing.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                                .font(.system(size: 35))
                                .padding(.horizontal, 20.0)
                        })
                    }
                    HStack {
                        Text("Preferences")
                            .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                            .font(.title)
                            .bold()
                        Spacer()
                    }.padding()
                    
                    Form {
                        Toggle(isOn: $audioMute, label: {
                            Text("Mute audio")
                                .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                                .font(.title2)
                        })
                        
                        Picker(selection: $backgroundMusic, label: Text("Background music").foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                                .font(.title2)
                               , content: {
                            Text("Amazon").tag("Amazon")
                            Text("Safari").tag("Safari")
                            Text("Actic").tag("Actic")
                        })
                    }.accentColor(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                    
                    Button(action: {
                        
                    }, label: {
                            Text("Connect to Apple Health")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .padding(.vertical, 10.0)
                                .padding(.horizontal, 30.0)
                                .background(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                                .cornerRadius(24.5)
                    })
                    
                }.navigationBarHidden(true)
            }
        
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(isPreferencesViewShowing: Binding.constant(true))
    }
}
