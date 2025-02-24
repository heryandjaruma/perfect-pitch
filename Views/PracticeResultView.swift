//
//  PracticeResultView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct PracticeResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var gameState: GameState
    @Binding var showPracticeResult: Bool
    
    var practiceGuesses: Int = 0
    var correctGuesses: Int = 0
    var onRetry: () -> Void
    
    init(showPracticeResult: Binding<Bool>, practiceGuesses: Int, correctGuesses: Int, onRetry: @escaping () -> Void) {
        self._showPracticeResult = showPracticeResult
        self.practiceGuesses = practiceGuesses
        self.correctGuesses = correctGuesses
        self.onRetry = onRetry
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .opacity(0.5)
            
            VStack {
                Text("You guessed \(correctGuesses) out of \(practiceGuesses).")
                    .font(.tangoSansBig)
                    .foregroundStyle(Color("DarkBlue"))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Button(action: {
                        gameState.resetPracticeStats()
                        showPracticeResult = false
                        onRetry()
                    }) {
                        Image("PracticeAgainButton")
                    }
                    Button(action: {
                        dismiss()
                    }) {
                        Image("BackButton")
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .allowsHitTesting(true)
    }
}

#Preview {
    PracticeResultView(showPracticeResult: .constant(false), practiceGuesses: 2, correctGuesses: 1, onRetry: { print("Retry tapped!") })
        .environmentObject(GameState())
}
