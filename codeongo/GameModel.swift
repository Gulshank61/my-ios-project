import Foundation

class GameModel: ObservableObject {
    @Published var board: [[TileState]] = [
        [.empty, .empty, .empty],
        [.empty, .empty, .empty],
        [.empty, .empty, .empty]
    ]
    @Published var currentPlayer: Player = .x

    enum Player: String {
        case x = "X"
        case o = "O"
    }
    
    func choose(_ row: Int, _ col: Int) {
        guard board[row][col] == .empty else { return }
        board[row][col] = (currentPlayer == .x) ? .x : .o
        currentPlayer = (currentPlayer == .x) ? .o : .x
    }
    
    func resetGame() {
        for row in 0..<3 {
            for col in 0..<3 {
                board[row][col] = .empty
            }
        }
        currentPlayer = .x
    }
}

enum TileState: Equatable {
    case empty
    case x
    case o
}