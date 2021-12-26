//
//  ContentView.swift
//  HealthKitAppChallenge
//
//  Created by President Raindas on 23/12/2021.
//

import SwiftUI

struct SessionScreen: View {
    
    @State var progressValue: Float = 0.0
    @State var cycleCounts:Int = 4
    @State var newSession: Bool = true
    
    var breathInTime: Int = 4
    var breathHoldTime: Int = 7
    var breathOutTime: Int = 8
    
    @State var timer: Int = 0
    @State var newCycleTimer: Int = 0
    
    @State var currentAction: Int = 0
    @State var currentActionMsg: String = ""
    
    @State var isShowingTryAgainScreen: Bool = false
    
    @Binding var isSessionScreenShowing: Bool
    
    
    var body: some View {
        ZStack {
            Color.init(red: 229/255, green: 229/255, blue: 229/255)
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    Spacer()
                    
                    ProgressBar(progress: self.$progressValue)
                        .frame(width: 223.0, height: 223.0)
                        .padding(.horizontal, 76.0)
                    
                    Spacer()
                    
                    Text(currentActionMsg)
                        .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                        .font(.title)
                        .bold()
                    
                    if newSession {
                        Stepper(value: $cycleCounts, in: 1...20) {
                            Text("Cycle counts (\(cycleCounts))")
                                .foregroundColor(Color.init(red: 75/255, green: 75/255, blue: 75/255))
                                .font(.title3)
                                .bold()
                        }.padding(.horizontal, 40.0)
                        
                        Spacer()
                    
                        SessionButton(buttonAction: startSession)
                    } else {
                        Spacer()
                        Text("Cycles left: \(cycleCounts)")
                            .foregroundColor(Color.init(red: 74/255, green: 122/255, blue: 102/255))
                            .font(.title2)
                            .bold()
                    }
                    
                    Spacer()
                    
                }
                
                HStack{
                    Image(systemName: "speaker.fill")
                    Spacer()
                    Button(action: {
                        isSessionScreenShowing.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                .foregroundColor(Color.init(red: 50/255, green: 87/255, blue: 74/255))
                .font(.system(size: 35))
                .padding(.horizontal, 20.0)
            }
        }.navigationBarHidden(true)
        .fullScreenCover(isPresented: $isShowingTryAgainScreen, content: {
            TryAgainScreen(isShowingScreen: $isShowingTryAgainScreen)
        })
    }
    
    func startSession() {
        newSession.toggle()
        incrementProgress()
    }
    
    func anotherCycle() {
        currentAction = 0
        newCycleTimer = 4
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            newCycleTimer -= 1
            if newCycleTimer < 1 {
                timer.invalidate()
                incrementProgress()
            } else {
                currentActionMsg = "Starting new cycle in \(newCycleTimer)"
            }
        }
    }
    
    func incrementProgress() {
        //let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        //self.progressValue += 0.1
        
        if currentAction == 1 {
            currentActionMsg = "Breath in"
            timer = breathInTime
        } else if currentAction == 2 {
            currentActionMsg = "Hold breath"
            timer = breathHoldTime
        } else if currentAction == 3 {
            currentActionMsg = "Breath out"
            timer = breathOutTime
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.progressValue += (0.1/Float(self.timer))
                if self.progressValue >= 1.0 {
                    if currentAction < 3 {
                        currentAction += 1
                        self.progressValue = 0.0
                        incrementProgress()
                    } else {
                        if cycleCounts > 1 {
                            cycleCounts -= 1
                            anotherCycle()
                        } else {
                            resetStats()
                        }
                    }
                    timer.invalidate()
                }
            }
        }
        
    }
    
    func resetStats() {
        isShowingTryAgainScreen.toggle()
        currentAction = 1
        progressValue = 0.0
        currentActionMsg = ""
        newSession.toggle()
    }
    
}

struct SessionScreen_Previews: PreviewProvider {
    static var previews: some View {
        SessionScreen(isSessionScreenShowing: Binding.constant(true))
    }
}
