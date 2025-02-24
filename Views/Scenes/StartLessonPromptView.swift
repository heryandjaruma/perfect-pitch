//
//  StartLessonPromptView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct StartLessonPromptView: View {
    var body: some View {
        VStack {
            Text("Regardless, let’s head to the practice mode and sharpen your skills!")
                .font(.tangoSansBig)
                .foregroundStyle(Color("DarkBlue"))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Button(action: {
                
            }) {
                Image("BeginPracticeButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 4)
            }
        }
        .padding()
    }
}

#Preview {
    StartLessonPromptView()
}
