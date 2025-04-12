import SwiftUI

struct ContentView: View {
    @ObservedObject var game: GameModel
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding()
            
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        TileView(state: self.$game.board[row][column])
                    }
                }
            }
            
            if let winner = game.checkForWinner() {
                Text("\(winner) wins!")
                  .padding()
                  .font(.headline)
                  .onAppear {
                    game.resetGame()
                  }
            }
        }
    }
}