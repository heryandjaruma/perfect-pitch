//
//  KeyboardManager.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import AVFoundation

@MainActor
class KeysManager: ObservableObject {
    @Published private var keyStates: [String: Bool] = [:]
    @Published var keyToGuess: String? = nil
    @Published var isCorrect: Bool? = nil
    @Published var isHiddenTrigger: Bool = true
    
    private let sampleManager: SampleManager
    private let gameState: GameState
    
    init(sampleManager: SampleManager, gameState: GameState) {
        self.sampleManager = sampleManager
        self.gameState = gameState
    }
    
    func triggerKey(_ keyId: String) {
        sampleManager.play(note: keyId)
        keyStates[keyId] = true
        isHiddenTrigger = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.keyStates[keyId] = false }
    }
    
    func hiddenTriggerKey(_ keyId: String) {
        sampleManager.play(note: keyId)
        keyStates[keyId] = true
        isHiddenTrigger = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.keyStates[keyId] = false
        }
    }
    
    func isKeyPressed(_ keyId: String) -> Bool { keyStates[keyId] ?? false }
    
    func playSequence(_ notes: [String], delay: Double = 0.5) {
        for (index, note) in notes.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * delay) {
                self.triggerKey(note)
            }
        }
    }
    
    func playKeyToGuess(_ keyId: String) {
        hiddenTriggerKey(keyId)
        keyToGuess = keyId
        isCorrect = nil
    }
    
    func replayKeyToGuess() {
        if let keyToGuess = keyToGuess {
            triggerKey(keyToGuess)
        }
    }
        
    func checkGuess(_ keyId: String) -> Bool {
        guard let keyToGuess = keyToGuess else { return false }
        let matches = keyId == keyToGuess
        isCorrect = matches
        if !matches {
            gameState.incrementStoryWrongGuesses()
        }
        return matches
    }
    
}
