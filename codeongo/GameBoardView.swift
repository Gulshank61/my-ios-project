import SwiftUI

struct GameBoardView: View {
    @Binding var gameModel: TicTacToeGameModel

    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { col in
                        TileView(tileState: $gameModel.board[row][col])
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                gameModel.makeMove(row: row, col: col)
                            }
                    }
                }
            }
        }
    }
}