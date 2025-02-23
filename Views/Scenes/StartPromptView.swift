//
//  StartPromptView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StartPromptView: View {
    var body: some View {
        Text("Do you have a perfect pitch? Let’s find out!")
            .font(.tangoSansBig)
            .foregroundStyle(Color("DarkBlue"))
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    StartPromptView()
}
