import SwiftUI

struct ContentView: View {
    @StateObject var navigationState = NavigationState()
    
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
                    
                    NavigationLink(destination: HowToView()
                        .navigationBarBackButtonHidden(true), label: {
                        Text("How To")
                            .font(.extraBeigeMedium)
                            .foregroundStyle(Color("Red"))
                    })
                    
                    NavigationLink(destination: AboutView()
                        .navigationBarBackButtonHidden(true), label: {
                        Text("About")
                            .font(.extraBeigeMedium)
                            .foregroundStyle(Color("Red"))
                    })
                }
                
                /// CREDITS
                VStack {
                    Spacer()
                    HStack {
                        Text("Swift Student Challenge 2025 Submission | © 2025 Heryan Djaruma | heryan.dev")
                            .foregroundStyle(Color("DarkBlue"))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }
        }
    }
}
