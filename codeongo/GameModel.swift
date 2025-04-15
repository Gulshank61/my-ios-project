import SwiftUI

enum Player {
    case x, o
}

enum TileState {
    case empty, occupied(Player)
}

class GameModel: ObservableObject {
    @Published var board: [[TileState]] = [
        [.empty, .empty, .empty],
        [.empty, .empty, .empty],
        [.empty, .empty, .empty]
    ]
    
    var currentPlayer: Player = .x
    
    func makeMove(at row: Int, _ column: Int) {
        if board[row][column] == .empty {
            board[row][column] = .occupied(currentPlayer)
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }
    
    func resetGame() {
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                board[row][column] = .empty
            }
        }
    }
}