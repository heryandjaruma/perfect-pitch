//
//  File.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import Foundation
@preconcurrency import AVFoundation

@MainActor
class BgAudioManager: ObservableObject {
    private var players: [String: AVAudioPlayer] = [:]
    private var fadeTimer: Timer?
    
    let CHOPIN = "Chopin"
    let BUTTON = "button"
    
    init() {
        preloadBg(audioFile: CHOPIN, fileExt: "mp3")
        preloadBg(audioFile: BUTTON, fileExt: "wav")
    }
    
    private func preloadBg(audioFile: String, fileExt: String) {
        guard let path = Bundle.main.path(forResource: "\(audioFile).\(fileExt)", ofType: nil) else {
            print("Background file \(audioFile) not found in bundle")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            players[audioFile] = player
        } catch {
            print("Error loading Bg Player: \(error)")
        }
    }

    func playBg() {
        self.players[CHOPIN]?.play()
    }
    
    func clickBtt() {
        self.players[BUTTON]?.play()
    }
    
    func stopBgFadeOut(duration: TimeInterval = 2.0) {
        guard let player = players[CHOPIN], ((players[CHOPIN]?.isPlaying) != nil) else { return }
        
        fadeTimer?.invalidate() // Cancel any existing fade
        let steps = 20
        let stepDuration = duration / Double(steps)
        let initialVolume = player.volume
        
        fadeTimer = Timer.scheduledTimer(withTimeInterval: stepDuration, repeats: true) { timer in
            player.volume -= initialVolume / Float(steps)
            if player.volume <= 0.0 {
                player.stop()
                player.volume = initialVolume
                timer.invalidate()
            }
        }
    }
    
}
