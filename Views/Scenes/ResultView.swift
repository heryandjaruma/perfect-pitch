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
        Text("You Got \(gameState.storyWrongGuesses)")
    }
}

#Preview {
    ResultView()
}
