//
//  Pitchonator.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct Pitchonator: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    let currentNote: String
    let showNoteText: Bool
    
    @EnvironmentObject private var keysManager: KeysManager
    
    var body: some View {
        ZStack {
            Image("PitchonatorBG")
                .resizable()
                .fixedSize()
            
            GeometryReader { geometry in
                VStack(spacing: 6) {
                    HStack {
                        Image("PitchonatorSound")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 13 * 4)
                        ZStack {
                            Image("PitchonatorKeyDisplay")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            if showNoteText {
                                Text(keysManager.keyToGuess ?? "")
                                    .font(Font.custom("TangoSans", size: 100))
                                    .foregroundStyle(keysManager.isCorrect == true ? Color.green.opacity(1) :
                                                     keysManager.isCorrect == false ? Color.red.opacity(1) :
                                                     Color.clear)
                            }

                        }
                        .frame(width: geometry.size.width / 13 * 4)
                    }
                    Image("PitchonatorSpeaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 5)
                        .onTapGesture {
                            keysManager.replayKeyToGuess()
                        }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .frame(width: screenWidth / 5 * 3, height: screenHeight)
    }

}

#Preview {
    Pitchonator(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height, currentNote: "C5", showNoteText: false)
        .environmentObject(KeysManager(sampleManager: SampleManager(), gameState: GameState()))
}
