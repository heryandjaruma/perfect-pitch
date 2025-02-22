//
//  WhiteKey.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct WhiteKey: View {
    var pianoKey: PianoKeyModel
    
    var body: some View {
        PianoKey(
            pianoKey: pianoKey,
            keyColor: "WhiteKey",
            textColor: "DarkBlue",
            widthRatio: 1.0,
            heightRatio: 1.0
        )
    }
}

#Preview {
    WhiteKey(pianoKey: PianoKeyModel(name: "C4", frequency: 261.63))
}
