//
//  PracticeView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct PracticeView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let SESSION_PRACTICE_GUESS = 3
    
    @StateObject private var sampleManager: SampleManager
    @StateObject private var keysManager: KeysManager
    @StateObject private var gameState: GameState
    
    @State private var promptOpacity: CGFloat = 1.0
    @State private var currentNote: String = ""
    @State private var showNoteText: Bool = false
    @State private var showPracticeResult: Bool = false
    
    let notesPool = ["C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "Bb4", "B4",
                     "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "Bb5", "B5", "C6"]
    
    init() {
        let sampleMgr = SampleManager()
        let gameStateInstance = GameState()
        self._sampleManager = StateObject(wrappedValue: sampleMgr)
        self._gameState = StateObject(wrappedValue: gameStateInstance)
        self._keysManager = StateObject(wrappedValue: KeysManager(sampleManager: sampleMgr, gameState: gameStateInstance))
    }
    
    var body: some View {
        ZStack {
            BackgroundWall()
            
            Keyboard()
                .zIndex(0)
            
            if showPracticeResult {
                PracticeResultView(showPracticeResult: $showPracticeResult, practiceGuesses: self.gameState.practiceGuesses, correctGuesses: self.gameState.correctGuesses, onRetry: selectRandomNote)
                    .environmentObject(gameState)
            } else {
                Text("A note will be played, and you need to press the appropriate key immediately afterward. Tap the speaker icon to hear it again. The indicator will show the correct key—red means you guessed wrong, and green means you guessed right.")
                    .font(.tangoSansSmall)
                    .foregroundStyle(Color("DarkBlue"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: screenWidth / 4 * 3)
                    .position(x: screenWidth / 2, y: screenHeight / 5)
                    .zIndex(3)
                
                Pitchonator(screenWidth: screenWidth, screenHeight: screenHeight, currentNote: currentNote, showNoteText: showNoteText)
                    .position(x: screenWidth / 2, y: screenHeight / 11 * 5)
                    .offset(y: screenHeight / 11)
                    .scaleEffect(screenHeight / 1030)
                
                backButton
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .zIndex(2)
            }
        }
        .environmentObject(keysManager)
        .environmentObject(gameState)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                selectRandomNote()
            }
        }
        .onChange(of: keysManager.isCorrect) { newValue in
            if let isCorrect = newValue {
                gameState.incrementPracticeGuesses(isCorrect: isCorrect)
                showNoteText = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    if gameState.practiceGuesses >= SESSION_PRACTICE_GUESS {
                        showPracticeResult = true
                    } else {
                        selectRandomNote()
                    }
                }
            }
        }
    }
    
    private func selectRandomNote() {
        let randomNote = notesPool.randomElement() ?? "C4"
        currentNote = randomNote
        showNoteText = false
        keysManager.playKeyToGuess(randomNote)
    }
    
    private var backButton: some View {
        HStack(alignment: .top) {
            BackButton(backText: "Do I Have Perfect Pitch")
                .padding(.leading, 16)
                .padding(.top, 16)
        }
    }
}

#Preview {
    PracticeView()
}
