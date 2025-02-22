//
//  Keyboard.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct Keyboard: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let keyWidth = UIScreen.main.bounds.width / 15 // Width of each white key
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack(spacing: 0) {
                ForEach(whiteKeys) { key in
                    WhiteKey(pianoKey: key)
                        .frame(width: keyWidth)
                }
            }
            .position(x: screenWidth / 2 , y: screenHeight * 4 / 5)
            .offset(x: 0, y: screenHeight / 5 / 2)
            
            ZStack {
                ForEach(blackKeys) { key in
                    if let posMultiplier = blackKeysMultipliers[key.name] {
                        BlackKey(pianoKey: key)
                            .position(x: keyWidth * posMultiplier, y: screenHeight * 4 / 5)
                            .offset(x: 0, y: screenHeight / 5 / 2 * 0.65)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

let blackKeysMultipliers: [String: CGFloat] = [
    "C#4": 1,
    "D#4": 2,
    "F#4": 4,
    "G#4": 5,
    "A#4": 6,
    "C#5": 8,
    "D#5": 9,
    "F#5": 11,
    "G#5": 12,
    "A#5": 13
]

#Preview {
    Keyboard()
}
