//
//  SampleManager.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import Foundation
import AVFoundation

class SampleManager: ObservableObject {
    private var players: [String: AVAudioPlayer] = [:]
    
    init() {
        preloadSounds()
    }
    
    private func preloadSounds() {
        let notes = ["C4",
                     "C#4",
                     "D4",
                     "D#4",
                     "E4",
                     "F4",
                     "F#4",
                     "G4",
                     "G#4",
                     "A4",
                     "Bb4",
                     "B4",
                     "C5",
                     "C#5",
                     "D5",
                     "D#5",
                     "E5",
                     "F5",
                     "F#5",
                     "G5",
                     "G#5",
                     "A5",
                     "Bb5",
                     "C6"]
        for note in notes {
            if let path = Bundle.main.path(forResource: "\(note).mp3", ofType: nil) {
                let url = URL(fileURLWithPath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    players[note] = player
                } catch {
                    print("Error loading \(note): \(error)")
                }
            }
        }
    }
    
    func play(note: String) {
        players[note]?.stop()
        players[note]?.currentTime = 0
        players[note]?.play()
    }
}
