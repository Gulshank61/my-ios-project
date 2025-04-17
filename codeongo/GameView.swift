import SwiftUI

struct GameView: View {
    @StateObject private var game = GameModel()

    var body: some View {
        VStack {
            Text(winnerMessage)
                .font(.title)
                .padding()
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<9) { index in
                    TileView(state: $game.board[index])
                        .onTapGesture {
                            game.makeMove(at: index)
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            if game.isGameOver {
                Button("New Game", action: resetGame)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
    }
    
    var winnerMessage: String {
        if let winner = game.winner {
            return "Player \(winner == .x ? "X" : "O") Wins!"
        } else if game.isGameOver {
            return "Game Over - Draw"
        } else {
            return "Player \(game.currentPlayer == .x ? "X" : "O")'s Turn"
        }
    }
    
    private func resetGame() {
        game = GameModel()
    }
}

struct TileView: View {
    @Binding var state: GameModel.TileState
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2))
            Text(symbolForState(state))
                .font(.largeTitle)
                .foregroundColor(Color.black)
        }
    }
    
    private func symbolForState(_ state: GameModel.TileState) -> String {
        switch state {
        case .empty:
            return " "
        case .taken(let player):
            return player == .x ? "X" : "O"
        }
    }
}