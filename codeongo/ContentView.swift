import SwiftUI

struct ContentView: View {
    @State private var gameModel = GameModel()
    
    var body: some View {
        VStack {
            GameView(gameModel: $gameModel)
            ActionButtonView()
        }
    }
}

struct ActionButtonView: View {
    var body: some View {
        HStack {
            Button("Make Payment") {
                // Implement payment action
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Send Email") {
                // Implement email action
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}