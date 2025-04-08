import SwiftUI

struct ContentView: View {
    @State private var board: [[TileState]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    @State private var isXTurn: Bool = true
    @State private var gameStatus: GameStatus = .active
    
    var body: some View {
        VStack {
            Text(gameStatus.message)
                .font(.largeTitle)
                .padding()
            
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        TileView(tile: $board[row][column], action: {
                            handleTap(row: row, column: column)
                        })
                    }
                }
            }
        }
    }
    
    private func handleTap(row: Int, column: Int) {
        if board[row][column] != .empty || gameStatus != .active {
            return
        }
        
        board[row][column] = isXTurn ? .x : .o
        isXTurn.toggle()
        checkForCompletion()
    }
    
    private func checkForCompletion() {
        if checkWinCondition(.x) {
            gameStatus = .won(player: .x)
        } else if checkWinCondition(.o) {
            gameStatus = .won(player: .o)
        } else if checkDrawCondition() {
            gameStatus = .draw
        }
    }
    
    private func checkWinCondition(_ player: TileState) -> Bool {
        let winPositions: [Set<[Int]>] = [
            Set([0, 1, 2].map { [$0, 0] }), Set([0, 1, 2].map { [$0, 1] }), Set([0, 1, 2].map { [$0, 2] }),
            Set([0, 1, 2].map { [0, $0] }), Set([0, 1, 2].map { [1, $0] }), Set([0, 1, 2].map { [2, $0] }),
            Set([[0, 0], [1, 1], [2, 2]]), Set([[0, 2], [1, 1], [2, 0]])
        ]
        
        for pos in winPositions {
            if pos.allSatisfy({ (row, col) in board[row][col] == player }) {
                return true
            }
        }
        return false
    }
    
    private func checkDrawCondition() -> Bool {
        for row in board {
            for tile in row where tile == .empty {
                return false
            }
        }
        return true
    }
}

enum TileState {
    case x, o, empty
    
    var image: Image? {
        switch self {
        case .x:
            return Image("xImage")
        case .o:
            return Image("oImage")
        default:
            return nil
        }
    }
}

enum GameStatus {
    case active, won(player: TileState), draw
    
    var message: String {
        switch self {
        case .active:
            return "Player's Turn"
        case .won(let player):
            return "Player \(player) Won!"
        case .draw:
            return "It's a draw!"
        }
    }
}