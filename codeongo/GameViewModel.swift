import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var board: [[TileState]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    private var currentPlayer: Player = .x
    
    func makeMove(row: Int, column: Int) {
        guard board[row][column] == .empty else { return }
        board[row][column] = currentPlayer.tileState
        currentPlayer = (currentPlayer == .x ? .o : .x)
    }

    func resetGame() {
        board = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
        currentPlayer = .x
    }
}

enum Player {
    case x
    case o

    var tileState: TileState {
        switch self {
            case .x: return .x
            case .o: return .o
        }
    }
}

enum TileState {
    case empty
    case x
    case o
}