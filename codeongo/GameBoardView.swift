import SwiftUI

struct GameBoardView: View {
    @ObservedObject var game: GameModel

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        GameTileView(tileState: $game.board[row][column])
                            .onTapGesture {
                                game.choose(row, column)
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
            Color.gray
            Text(tileState.symbol)
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 80, height: 80)
        .cornerRadius(10)
    }
}

extension TileState {
    var symbol: String {
        switch self {
        case .empty: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
}