import SwiftUI

struct ContentView: View {
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
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
            VStack(spacing: 30) {
                Image("Title")
                Spacer()
                    .frame(height: 20)
                Button(action: {}) {
                    Image("DoIHavePerfectPitch")
                }
                Button(action: {}) {
                    Image("Learn")
                }
                Button(action: {}) {
                    Image("HowTo")
                }
                Button(action: {}) {
                    Image("About")
                }
            }
        }
    }
}
