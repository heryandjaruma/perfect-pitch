//
//  Keyboard.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct Keyboard: View {
    private let keyWidth = UIScreen.main.bounds.width / 15 // Width of each white key
    
    var body: some View {
        ZStack {
            // White Keys Layer
            HStack(spacing: 0) {
                ForEach(whiteKeys) { key in
                    WhiteKey(pianoKey: key)
                        .frame(width: keyWidth) // Set consistent width
                }
            }
            
            // Black Keys Layer (Stacked Above, Using Absolute Positioning)
            HStack(spacing: 0) {
                ForEach(blackKeys) { key in
                    if let position = blackKeyPosition[key.name] {
                        BlackKey(pianoKey: key)
                            .frame(width: 3) // Make black keys smaller
                            .offset(x: (position - 7) * keyWidth) // Center over white keys
                    }
                }
            }
        }
    }
}

let blackKeyPosition: [String: CGFloat] = [
    "C#4": 0.75, "D#4": 1.75,
    "F#4": 3.75, "G#4": 4.75, "A#4": 5.75,
    "C#5": 7.75, "D#5": 8.75,
    "F#5": 10.75, "G#5": 11.75, "A#5": 12.75
]

#Preview {
    Keyboard()
}
