import Foundation

struct GameModel {
    var board: [[TileState]]
    
    init() {
        self.board = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
    
    mutating func makeMove(at position: (Int, Int)) {
        if board[position.0][position.1] == .empty {
            board[position.0][position.1] = .x // Basic implementation, add turn logic for X and O
        }
    }
}

enum TileState {
    case empty
    case x
    case o
}