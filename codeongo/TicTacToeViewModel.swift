import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published var gameBoard: [[TileState]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    @Published var showingAlert = false
    @Published var alertMessage = ""
    private var currentPlayer: Player = .x

    func makeMove(row: Int, column: Int) {
        guard gameBoard[row][column] == .empty else { return }

        gameBoard[row][column] = TileState(player: currentPlayer)
        if checkWin(for: currentPlayer) {
            alertMessage = "\(currentPlayer.symbol) Wins!"
            showingAlert = true
        } else if checkDraw() {
            alertMessage = "It's a draw!"
            showingAlert = true
        }
        currentPlayer.toggle()
    }

    private func checkWin(for player: Player) -> Bool {
        let winStates: [[TileState]] = [
            // Horizontal Lines
            gameBoard[0], gameBoard[1], gameBoard[2],
            // Vertical Lines
            [gameBoard[0][0], gameBoard[1][0], gameBoard[2][0]],
            [gameBoard[0][1], gameBoard[1][1], gameBoard[2][1]],
            [gameBoard[0][2], gameBoard[1][2], gameBoard[2][2]],
            // Diagonal Lines
            [gameBoard[0][0], gameBoard[1][1], gameBoard[2][2]],
            [gameBoard[2][0], gameBoard[1][1], gameBoard[0][2]]
        ]
        return winStates.contains { $0.allSatisfy { $0 == TileState(player: player) } }
    }

    private func checkDraw() -> Bool {
        return gameBoard.allSatisfy { row in row.allSatisfy { $0 != .empty } }
    }
}