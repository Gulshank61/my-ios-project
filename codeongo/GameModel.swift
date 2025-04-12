import Foundation

class GameModel: ObservableObject {
    @Published var board: [[TileState]] = [
        [.empty, .empty, .empty],
        [.empty, .empty, .empty],
        [.empty, .empty, .empty]
    ]
    
    func resetGame() {
        board = [
            [.empty, .empty, .empty],
            [.empty, .empty, .empty],
            [.empty, .empty, .empty]
        ]
    }
    
    func checkForWinner() -> String? {
        // Horizontal and vertical checks
        for i in 0..<3 {
            if board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != .empty {
                return board[i][0].rawValue.capitalized
            }
            if board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != .empty {
                return board[0][i].rawValue.capitalized
            }
        }
        
        // Diagonal checks
        if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != .empty {
            return board[0][0].rawValue.capitalized
        }
        if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != .empty {
            return board[0][2].rawValue.capitalized
        }
        
        return nil
    }
}

enum TileState: String {
    case empty
    case x
    case o
}