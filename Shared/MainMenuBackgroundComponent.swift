//
//  MainMenuBackgroundView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import SwiftUI

struct MainMenuBackgroundComponent: View {
    private var screenHeight: CGFloat = UIScreen.main.bounds.height
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Color("Cream")
                .ignoresSafeArea()
            Image("Wall")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("PianoHorizontal")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
            Image("Notes")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth * 6 / 8)
        }
    }
}

#Preview {
    MainMenuBackgroundComponent()
}
