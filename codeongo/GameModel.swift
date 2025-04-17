import Foundation

class GameModel: ObservableObject {
    @Published var board: [TileState] = Array(repeating: .empty, count: 9)
    @Published var currentPlayer: Player = .x
    @Published var winner: Player?
    @Published var isGameOver: Bool = false

    enum Player {
        case x, o
        
        var next: Player {
            switch self {
            case .x:
                return .o
            case .o:
                return .x
            }
        }
    }
    
    enum TileState {
        case empty, taken(Player)
    }

    func makeMove(at index: Int) {
        guard !isGameOver, board[index] == .empty else { return }
        board[index] = .taken(currentPlayer)
        
        if checkWin(for: currentPlayer) {
            winner = currentPlayer
            isGameOver = true
        } else if !board.contains(.empty) {
            isGameOver = true
        } else {
            currentPlayer = currentPlayer.next
        }
    }

    private func checkWin(for player: Player) -> Bool {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]
        
        return winPatterns.contains { pattern in
            pattern.allSatisfy { index in
                board[index] == .taken(player)
            }
        }
    }
}