import Foundation

class GameViewModel: ObservableObject {
    @Published var tiles = [[TileState]](repeating: [TileState](repeating: .empty, count: 3), count: 3)
    @Published var currentPlayer: TileState = .x
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false

    func tapTile(at position: (Int, Int)) {
        if tiles[position.0][position.1] == .empty {
            tiles[position.0][position.1] = currentPlayer
            if checkWin(for: currentPlayer) {
                alertMessage = "\(currentPlayer.symbol) Wins!"
                showAlert = true
            } else if checkDraw() {
                alertMessage = "It's a draw!"
                showAlert = true
            } else {
                currentPlayer = currentPlayer == .x ? .o : .x
            }
        }
    }

    func resetGame() {
        tiles = [[TileState]](repeating: [TileState](repeating: .empty, count: 3), count: 3)
        currentPlayer = .x
        showAlert = false
    }

    private func checkWin(for player: TileState) -> Bool {
        for i in 0..<3 {
            if tiles[i].allSatisfy({ $0 == player }) ||
               (0..<3).allSatisfy({ tiles[$0][i] == player }) {
                return true
            }
        }

        return (tiles[0][0] == player && tiles[1][1] == player && tiles[2][2] == player) ||
               (tiles[0][2] == player && tiles[1][1] == player && tiles[2][0] == player)
    }

    private func checkDraw() -> Bool {
        return tiles.allSatisfy { row in row.allSatisfy { $0 != .empty } }
    }
}