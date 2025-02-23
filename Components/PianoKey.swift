//
//  PianoKey.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI
import AVFoundation

struct PianoKey: View {
    @EnvironmentObject private var keysManager: KeysManager
    
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    private var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    private var NUMBER_OF_WHITE_KEYS: CGFloat = 15
    
    var pianoKey: PianoKeyModel
    var keyColor: String
    var textColor: String
    var widthRatio: CGFloat
    var heightRatio: CGFloat
    
    init(pianoKey: PianoKeyModel, keyColor: String, textColor: String, widthRatio: CGFloat, heightRatio: CGFloat) {
        self.pianoKey = pianoKey
        self.keyColor = keyColor
        self.textColor = textColor
        self.widthRatio = widthRatio
        self.heightRatio = heightRatio
    }
    
    var body: some View {
        Image(keyColor)
            .resizable()
            .frame(
                width: (screenWidth / NUMBER_OF_WHITE_KEYS) * widthRatio,
                height: (screenHeight / 5) * heightRatio
            )
            .overlay(keysManager.isKeyPressed(pianoKey.id) ? Color.white.opacity(0.4) : Color.clear)
            .overlay(alignment: .bottom) {
                if keysManager.isKeyPressed(pianoKey.id) {
                    Text(pianoKey.name)
                        .font(.tangoSansSmall)
                        .foregroundColor(Color(textColor))
                        .opacity(0.3)
                        .padding([.bottom], 20)
                }
            }
            .simultaneousGesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    keysManager.triggerKey(pianoKey.id)
                }
            )
    }
    
}

#Preview {
    PianoKey(pianoKey: PianoKeyModel(name: "C4", frequency: 111), keyColor: "WhiteKey", textColor: "DarkBlue", widthRatio: 1.0, heightRatio: 1.0)
        .environmentObject(KeysManager(sampleManager: SampleManager()))
}
