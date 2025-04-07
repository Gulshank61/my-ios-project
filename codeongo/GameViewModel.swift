import SwiftUI

class GameViewModel: ObservableObject {
    @Published var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @Published var currentPlayer: Player = .x
    @Published var gameOver: Bool = false
    @Published var winningMessage: String = ""
    
    func processPlayerMove(for row: Int, and column: Int) {
        if board[row][column] == nil {
            board[row][column] = currentPlayer
            if checkWinCondition(for: currentPlayer) {
                gameOver = true
                winningMessage = "\(currentPlayer.rawValue) Wins!"
            } else if checkDrawCondition() {
                gameOver = true
                winningMessage = "Draw!"
            } else {
                currentPlayer = currentPlayer == .x ? .o : .x
            }
        }
    }
    
    func checkWinCondition(for player: Player) -> Bool {
        let winPatterns: [[(Int, Int)]] = [
            [(0,0), (0,1), (0,2)], [(1,0), (1,1), (1,2)], [(2,0), (2,1), (2,2)],
            [(0,0), (1,0), (2,0)], [(0,1), (1,1), (2,1)], [(0,2), (1,2), (2,2)],
            [(0,0), (1,1), (2,2)], [(0,2), (1,1), (2,0)]
        ]
        for pattern in winPatterns {
            if pattern.allSatisfy({ board[$0.0][$0.1] == player }) {
                return true
            }
        }
        return false
    }
    
    func checkDrawCondition() -> Bool {
        board.allSatisfy { row in row.allSatisfy { $0 != nil } }
    }
    
    func restartGame() {
        board = Array(repeating: Array(repeating: nil, count: 3), count: 3)
        currentPlayer = .x
        gameOver = false
        winningMessage = ""
    }
}

enum Player: String {
    case x = "X"
    case o = "O"
}
