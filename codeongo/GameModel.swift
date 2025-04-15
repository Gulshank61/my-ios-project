import SwiftUI

struct GameModel {
    var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    var currentPlayer: Player = .x

    mutating func makeMove(at position: (Int, Int)) {
        if board[position.0][position.1] == nil {
            board[position.0][position.1] = currentPlayer
            if checkWinner(player: currentPlayer) {
                winner = currentPlayer
            } else if isBoardFull {
                winner = nil
            }
            currentPlayer = currentPlayer == .x ? .o : .x
        }
    }

    private func checkWinner(player: Player) -> Bool {
        // Horizontal and vertical lines check
        for index in 0...2 {
            if ((board[index].allSatisfy { $0 == player }) ||
                (board.map { $0[index] }.allSatisfy { $0 == player })) {
                return true
            }
        }

        // Diagonal lines check
        if (board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
           (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
            return true
        }

        return false
    }

    var isBoardFull: Bool {
        !board.flatMap { $0 }.contains(nil)
    }

    var winner: Player?
}

enum Player {
    case x, o

    var symbol: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}