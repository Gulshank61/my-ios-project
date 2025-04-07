import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 15) {
                    ForEach(0..<3, id: \.self) { column in
                        GameSquareView(action: {
                            viewModel.processPlayerMove(for: row, and: column)
                        }, player: viewModel.board[row][column])
                        .frame(width: 100, height: 100)
                        .border(Color.black, width: 2)
                    }
                }
            }
            if viewModel.gameOver {
                Text(viewModel.winningMessage)
                    .font(.largeTitle)
                    .padding()
                Button("Restart Game") {
                    viewModel.restartGame()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}