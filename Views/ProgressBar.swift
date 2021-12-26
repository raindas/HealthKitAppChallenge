//
//  ContentView.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 23/12/2021.
//

import SwiftUI

struct ProgressBar: View {
    
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .foregroundColor(Color.init(red: 240/255, green: 240/255, blue: 240/255))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
//            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
//                .font(.largeTitle)
//                .bold()
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: Binding.constant(0.30))
    }
}
