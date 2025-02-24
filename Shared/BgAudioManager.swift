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
    private var bgPlayer: AVAudioPlayer?
    private var fadeTimer: Timer?
    
    init() {
        preloadBg()
    }
    
    private func preloadBg() {
        guard let path = Bundle.main.path(forResource: "Chopin.mp3", ofType: nil) else {
            print("Background file 'Chopin.mp3' not found in bundle")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            bgPlayer = try AVAudioPlayer(contentsOf: url)
            bgPlayer?.prepareToPlay()
        } catch {
            print("Error loading Bg Player: \(error)")
        }
    }

    func playBg() {
        self.bgPlayer?.play()
    }
    
    func stopBgFadeOut(duration: TimeInterval = 2.0) {
        guard let player = bgPlayer, player.isPlaying else { return }
        
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
