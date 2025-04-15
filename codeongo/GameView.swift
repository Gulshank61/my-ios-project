import SwiftUI

struct GameView: View {
    @Binding var gameModel: GameModel
    
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        GameTileView(tileState: $gameModel.board[row][column])
                            .onTapGesture {
                                gameModel.makeMove(at: (row, column))
                            }
                    }
                }
            }
        }
    }
}

struct GameTileView: View {
    @Binding var tileState: TileState
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(tileState == .x ? "X" : tileState == .o ? "O" : "")
                .font(.largeTitle)
                .foregroundColor(tileState == .x ? .red : .blue)
        }
        .frame(width: 100, height: 100)
        .cornerRadius(8)
    }
}