//
//  BlackKey.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct BlackKey: View {
    var pianoKey: PianoKeyModel
    
    var body: some View {
        PianoKey(
            pianoKey: pianoKey,
            keyColor: "BlackKey",
            textColor: "Cream",
            widthRatio: 0.6, // Black keys are 60% of white keys' width
            heightRatio: 0.65 // Black keys are shorter
        )
    }
}

#Preview {
    BlackKey(pianoKey: PianoKeyModel(name: "C#", frequency: 123))
}
