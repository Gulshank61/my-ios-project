import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameModel()

    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<3) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3) { column in
                        GameTileView(tileState: $game.board[row * 3 + column])
                    }
                }
            }
            if game.checkWinner() != nil {
                Text("Winner: \(game.checkWinner()!)")
                    .padding()
                    .font(.headline)
            } else if game.checkDraw() {
                Text("The game is a draw")
                    .padding()
                    .font(.headline)
            }
        }
        .padding()
    }
}