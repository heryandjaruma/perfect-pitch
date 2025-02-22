//
//  SwiftUIView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct WhiteKey: View {
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    private var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    private var NUMBER_OF_WHITE_KEYS: CGFloat = 14
    
    private var pianoKey: PianoKey
    
    init(pianoKey: PianoKey) {
        self.pianoKey = pianoKey
    }
    
    var body: some View {
        Image("WhiteKey")
            .resizable()
            .frame(width: screenWidth / NUMBER_OF_WHITE_KEYS) // size of one white key relative to screen
            .frame(height: screenHeight / 5) // 1/5 of a height screen
            .overlay(
                Text(pianoKey.name)
                    .foregroundColor(Color("DarkBlue"))
            )
    }
}

#Preview {
    WhiteKey(pianoKey: PianoKey(name: "C4", frequency: 261.63))
}
