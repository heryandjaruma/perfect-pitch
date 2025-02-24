//
//  MusicIsYourThingView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct MusicIsYourThingView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("If you can develop your relative pitch to be as good as those with perfect pitch, or even achieve perfect pitch yourself, then you might have a musical gift. Looks like music is your thing!")
                .font(.tangoSansMedium)
                .foregroundStyle(Color("DarkBlue"))
                .multilineTextAlignment(.center)
            Image("Singing")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width / 8)
        }
        .padding()
    }
}

#Preview {
    MusicIsYourThingView()
}
