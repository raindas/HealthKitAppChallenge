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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    
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
                }).padding()
                
                Picker(selection: $backgroundMusic, label: Text("Background music"), content: {
                    Text("Amazon").tag("Amazon")
                })
            }
        }.accentColor(Color.init(red: 50/255, green: 87/255, blue: 74/255))
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
