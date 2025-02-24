//
//  PerfectPitchTheoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct PerfectPitchTheoryView: View {
    var body: some View {
        HStack(spacing: 30) {
            Image("ThatsC")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: .infinity)
            Text("Perfect pitch refers to a person’s ability to identify a note played out loud without seeing how it was played on an instrument and without reference to another note.")
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
    PerfectPitchTheoryView()
}
