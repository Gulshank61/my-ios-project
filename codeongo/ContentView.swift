import SwiftUI

struct ContentView: View {
    @State private var gameModel = GameModel()

    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<3) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3) { column in
                        GameSquareView(player: $gameModel.board[row][column])
                            .frame(width: 100, height: 100)
                            .border(Color.black, width: 2)
                            .onTapGesture {
                                gameModel.makeMove(at: (row, column))
                            }
                    }
                }
            }
            if gameModel.winner != nil {
                Text("Player \(gameModel.winner!) wins!")
                    .font(.largeTitle)
                    .padding()
            } else if gameModel.isBoardFull {
                Text("It's a draw!")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .padding()
    }
}