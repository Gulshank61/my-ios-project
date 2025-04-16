import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding()

            ForEach(0..<3) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3) { column in
                        GameTileView(tile: self.$viewModel.tiles[row][column])
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                self.viewModel.tapTile(at: (row, column))
                            }
                    }
                }
            }

            if viewModel.showAlert {
                AlertView(message: viewModel.alertMessage, resetAction: viewModel.resetGame)
            }
        }
    }
}