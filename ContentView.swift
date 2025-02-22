import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            MainMenuBackgroundComponent()

            VStack(spacing: 30) {
                Image("Title")
                Spacer()
                    .frame(height: 20)
                Button(action: {}) {
                    Text("Do I Have Perfect Pitch?")
                        .font(.extraBeigeMedium)
                        .foregroundStyle(Color("Red"))
                }
                Button(action: {}) {
                    Text("Learn")
                        .font(.extraBeigeMedium)
                        .foregroundStyle(Color("Red"))
                }
                Button(action: {}) {
                    Text("How To")
                        .font(.extraBeigeMedium)
                        .foregroundStyle(Color("Red"))
                }
                Button(action: {}) {
                    Text("About")
                        .font(.extraBeigeMedium)
                        .foregroundStyle(Color("Red"))
                }
            }
        }
    }
    
}
