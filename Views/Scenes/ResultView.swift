//
//  ResultView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var gameState: GameState
    
    var body: some View {
        
        if (gameState.storyWrongGuesses <= 1) {
            Text("Wow! You might have perfect pitch!")
                .multilineTextAlignment(.center)
                .font(.tangoSansBig)
                .foregroundStyle(Color("DarkBlue"))
        }
        else if (gameState.storyWrongGuesses >= 2 && gameState.storyWrongGuesses < 6) {
            Text("Great! You guessed some notes correctly!\nYou can still master it!")
                .multilineTextAlignment(.center)
                .font(.tangoSansBig)
                .foregroundStyle(Color("DarkBlue"))
        }
        else {
            Text("Oh no! You might not have perfect pitch.\nBut don’t worry—you can still learn it!")
                .multilineTextAlignment(.center)
                .font(.tangoSansBig)
                .foregroundStyle(Color("DarkBlue"))
        }
        
    }
}

#Preview {
    ResultView()
        .environmentObject(GameState())
}
