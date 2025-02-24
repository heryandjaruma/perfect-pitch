//
//  TwelveNotesTheoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct TwelveNotesTheoryView: View {
    @EnvironmentObject private var keysManager: KeysManager
    private let notes = ["C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "Bb4", "B4"]
    
    var body: some View {
        Text("A music scale has 12 notes. Each note has its own name, as shown below. Hear how it sounds!")
            .font(.tangoSansBig)
            .foregroundStyle(Color("DarkBlue"))
            .multilineTextAlignment(.center)
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    keysManager.playSequence(notes, delay: 0.3)
                }
            }
    }
}

#Preview {
    TwelveNotesTheoryView()
        .environmentObject(KeysManager(sampleManager: SampleManager(), gameState: GameState()))
}
