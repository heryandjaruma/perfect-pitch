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
    private let sampleManager: SampleManager
    
    init(sampleManager: SampleManager) {
        self.sampleManager = sampleManager
    }
    
    func triggerKey(_ keyId: String) {
        sampleManager.play(note: keyId)
        keyStates[keyId] = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.keyStates[keyId] = false }
    }
    
    func isKeyPressed(_ keyId: String) -> Bool { keyStates[keyId] ?? false }
    
    func playSequence(_ notes: [String], delay: Double = 0.5) {
        for (index, note) in notes.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * delay) {
                self.triggerKey(note)
            }
        }
    }
    
}
