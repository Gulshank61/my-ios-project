import SwiftUI

class GameViewModel: ObservableObject {
    @Published var squares: [Player] = Array(repeating: .none, count: 9)
    @Published var isGameboardDisabled = false
    @Published var alertIsVisible = false
    @Published var alertMessage = ""

    private var currentPlayer: Player = .x
    
    enum Player {
        case x, o, none
    }
    
    func processPlayerMove(for index: Int) {
        if squares[index] == .none {
            squares[index] = currentPlayer
            isGameboardDisabled = true
            
            if checkWinner() {
                alertMessage = "\(currentPlayer) Wins!"
                alertIsVisible = true
                return
            }
            
            if !squares.contains(.none) {
                alertMessage = "It's a draw!"
                alertIsVisible = true
                return
            }
            
            currentPlayer = currentPlayer == .x ? .o : .x
            isGameboardDisabled = false
        }
    }
    
    func checkWinner() -> Bool {
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]
        
        return winPatterns.contains { pattern in
            pattern.allSatisfy { index in squares[index] == currentPlayer }
        }
    }
    
    func resetGame() {
        squares = Array(repeating: .none, count: 9)
        currentPlayer = .x
        isGameboardDisabled = false
        alertIsVisible = false
    }
}