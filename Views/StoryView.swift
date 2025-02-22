//
//  StoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            BackgroundWall()
            
            /// BACK
            HStack(alignment: .top) {
                BackButton(backText: "Do I Have Perfect Pitch")
                    .padding(.leading, 16)
                    .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            Keyboard()
            
            /// BOOK STAND
            VStack() {
                ZStack {

                }
            }
        }
    }
}

#Preview {
    StoryView()
}
