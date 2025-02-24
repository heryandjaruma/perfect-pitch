//
//  RelativePitchTheoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct RelativePitchTheoryView: View {
    var body: some View {
        HStack(spacing: 30) {
            Text("On the other hand, if you have relative pitch, it means you can identify notes, but only in relation to one another.")
                .font(.tangoSansMedium)
                .foregroundStyle(Color("DarkBlue"))
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
            Image("ThatsE")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: .infinity)
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    RelativePitchTheoryView()
}
