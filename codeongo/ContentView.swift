import SwiftUI

struct ContentView: View {
    @State private var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @State private var currentPlayer: Player = .x
    @State private var isGameActive = true
    @State private var winner: Player?

    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
            
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        CellView(player: board[row][column])
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                handleTap(row: row, column: column)
                            }
                    }
                }
            }
            Spacer()
            
            if let winner = winner {
                Text("\(winner.rawValue.uppercased()) Wins!")
                    .font(.title)
            } else if isBoardFull() {
                Text("Game Tied")
                    .font(.title)
            }
        }
    }
    
    private func handleTap(row: Int, column: Int) {
        if isGameActive && board[row][column] == nil {
            board[row][column] = currentPlayer
            if checkForVictory(player: currentPlayer) {
                winner = currentPlayer
                isGameActive = false
            } else if isBoardFull() {
                isGameActive = false
            }
            
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }
    
    private func isBoardFull() -> Bool {
        for rows in board {
            for cell in rows where cell == nil {
                return false
            }
        }
        return true
    }
    
    private func checkForVictory(player: Player) -> Bool {
        // Horizontal and vertical checks
        for i in 0..<3 {
            if (board[i][0] == player && board[i][1] == player && board[i][2] == player) ||
                (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
                return true
            }
        }
        
        // Diagonal checks
        if (board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
           (board[2][0] == player && board[1][1] == player && board[0][2] == player) {
            return true
        }
        
        return false
    }
}

enum Player: String {
    case x = "X"
    case o = "O"
}

struct CellView: View {
    var player: Player?
    
    var body: some View {
        ZStack {
            Color.gray
            Image(systemName: playerImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(15)
        }
    }
    
    var playerImage: String {
        switch player {
        case .x:
            return "xmark"
        case .o:
            return "circle"
        default:
            return ""
        }
    }
}