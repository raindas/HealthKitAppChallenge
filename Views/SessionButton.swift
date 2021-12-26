//
//  SessionButton.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 25/12/2021.
//

import SwiftUI

struct SessionButton: View {
    
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction, label: {
                Text("Begin session")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 57.0)
                    .background(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                    .cornerRadius(24.5)
        })
    }
}
