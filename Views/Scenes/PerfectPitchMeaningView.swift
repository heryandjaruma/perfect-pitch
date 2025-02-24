//
//  PerfectPitchMeaningView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct PerfectPitchMeaningView: View {
    var body: some View {
        HStack(spacing: 30) {
            Image("ThatsC")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: .infinity)
            Text("That means you can produce a given note on cue by singing, or just remember which note is it.")
                .font(.tangoSansMedium)
                .foregroundStyle(Color("DarkBlue"))
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    PerfectPitchMeaningView()
}
