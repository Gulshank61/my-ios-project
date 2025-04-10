import SwiftUI

class GameModel: ObservableObject {
    @Published var board: [TileState] = Array(repeating: .empty, count: 9)

    func checkWinner() -> String? {
        let winPatterns: [(Int, Int, Int)] = [
            (0, 1, 2), (3, 4, 5), (6, 7, 8), // Horizontal
            (0, 3, 6), (1, 4, 7), (2, 5, 8), // Vertical
            (0, 4, 8), (2, 4, 6) // Diagonal
        ]
        for (a, b, c) in winPatterns {
            if board[a] == board[b], board[b] == board[c], board[a] != .empty {
                return board[a].rawValue
            }
        }
        return nil
    }

    func checkDraw() -> Bool {
        return board.allSatisfy { $0 != .empty }
    }
}