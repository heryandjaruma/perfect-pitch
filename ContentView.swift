import SwiftUI

struct ContentView: View {
    
    @StateObject private var bgAudioManager: BgAudioManager
    
    public init() {
        self._bgAudioManager = StateObject(wrappedValue: BgAudioManager())
    }

    var body: some View {
        
        NavigationStack {
            ZStack {
                MainMenuBackgroundComponent()
                
                VStack(spacing: 30) {
                    Image("Title")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height / 5)
                    Spacer()
                        .frame(height: 20)
                    
                    
                    /// MENUS
                    NavigationLink(destination: StoryView()
                        .navigationBarBackButtonHidden(true), label: {
                        Text("Do I Have Perfect Pitch?")
                            .font(.extraBeigeMedium)
                            .foregroundStyle(Color("Red"))
                    })
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
        .environmentObject(bgAudioManager)
        .onAppear {
            bgAudioManager.playBg()
        }
    }
}
