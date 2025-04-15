import SwiftUI

struct GameBoardView: View {
    @ObservedObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        GameTileView(tileState: gameModel.board[row][column]) {
                            gameModel.makeMove(at: row, column)
                        }
                    }
                }
            }
        }
    }
}