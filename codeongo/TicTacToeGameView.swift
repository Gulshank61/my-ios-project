import SwiftUI

struct TicTacToeGameView: View {
    @StateObject private var viewModel = TicTacToeViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding()

            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3, id: \.self) { column in
                        TicTacToeTileView(tileState: $viewModel.gameBoard[row][column])
                            .frame(width: 100, height: 100)
                            .border(Color.black, width: 2)
                            .onTapGesture {
                                viewModel.makeMove(row: row, column: column)
                            }
                    }
                }
            }

            if viewModel.showingAlert {
                Text(viewModel.alertMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}