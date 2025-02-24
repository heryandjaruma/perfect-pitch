//
//  NowHearThisNote1View.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct NowHearThisNote1View: View {
    @EnvironmentObject private var keysManager: KeysManager
    
    @State private var buttonOpacity: Double = 0.0
    @State private var questionOpacity: Double = 0.0
    
    let KEY_TO_GUESS = "C4"
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Now hear this note")
                .font(.tangoSansMedium)
                .foregroundStyle(Color("DarkBlue"))
            
            Image("SoundButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width / 8)
                .opacity(buttonOpacity)
                .onTapGesture {
                    keysManager.hiddenTriggerKey(KEY_TO_GUESS)
                }
            
            Text("Can you recall which key it belongs to?\n(Press any key you think is correct)")
                .multilineTextAlignment(.center)
                .font(.tangoSansMedium)
                .foregroundStyle(Color("DarkBlue"))
                .opacity(questionOpacity)
            
            if let isCorrect = keysManager.isCorrect, let note = keysManager.keyToGuess {
                Text(isCorrect ? "Correct! The note is \(note)" : "Try again!")
                    .font(.tangoSansMedium)
                    .foregroundStyle(isCorrect ? Color.green : Color.red)
                    .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeIn(duration: 0.5)) {
                    buttonOpacity = 1.0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                keysManager.playKeyToGuess(KEY_TO_GUESS)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeIn(duration: 0.5)) {
                    questionOpacity = 1.0
                }
            }
        }
    }
}

#Preview {
    NowHearThisNote1View()
        .environmentObject(KeysManager(sampleManager: SampleManager(), gameState: GameState()))
}
