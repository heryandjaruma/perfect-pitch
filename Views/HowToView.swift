//
//  HowToView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
        
        ZStack {
            BackgroundWall()
            
            VStack {
                HStack {
                    BackButton(backText: "")
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            
            ScrollView(.vertical) {
                
                VStack(spacing: 40) {
                    Text("How to \"Perfect Pitch\"")
                        .font(.extraBeigeBig)
                        .foregroundStyle(Color("Red"))
                        .multilineTextAlignment(.center)
                    Text("This app lets you explore whether or not you have perfect pitch. If not, you can learn relative pitch by practicing note recognition.")
                        .font(.tangoSansMedium)
                        .foregroundStyle(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                    Text("1. Follow the instructions on the screen.")
                        .font(.tangoSansMedium)
                        .foregroundStyle(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                    Text("2. Press 'Next' to move to the next scene.")
                        .font(.tangoSansMedium)
                        .foregroundStyle(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                    Text("3. During most interactions, you will need to press a key on the keyboard when prompted.")
                        .font(.tangoSansMedium)
                        .foregroundStyle(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                    Text("4. The story consists of two parts: a short music theory section and a practice session, which you can repeat as many times as you like.")
                        .font(.tangoSansMedium)
                        .foregroundStyle(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 4 * 3)
            }
        }
    }
}


#Preview {
    HowToView()
}
