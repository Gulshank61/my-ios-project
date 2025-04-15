import Foundation

class TicTacToeGameModel: ObservableObject {
    @Published var board: [[TileState]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)

    func makeMove(row: Int, col: Int) {
        if board[row][col] == .empty {
            board[row][col] = whoseTurn() == 0 ? .x : .o
        }
    }

    private func whoseTurn() -> Int {
        let flatBoard = board.joined()
        let xCount = flatBoard.filter({ $0 == .x }).count
        let oCount = flatBoard.filter({ $0 == .o }).count
        return xCount <= oCount ? 0 : 1
    }
}

enum TileState {
    case empty, x, o
}