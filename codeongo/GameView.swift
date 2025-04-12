import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.headline)
                .padding()
            Spacer()
            boardView
            Spacer()
            resetButton
        }
        .padding()
    }

    var boardView: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        TileView(state: $viewModel.board[row][column])
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .border(Color.black)
                            .onTapGesture {
                                viewModel.makeMove(row: row, column: column)
                            }
                    }
                }
            }
        }
    }

    var resetButton: some View {
        Button("Reset") {
            viewModel.resetGame()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}