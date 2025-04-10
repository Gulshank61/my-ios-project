import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3, id: \.self) { column in
                        TileView(tileState: $viewModel.tiles[row][column])
                            .frame(width: 100, height: 100)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
            }
            Button("Restart Game") {
                viewModel.resetGame()
            }
        }
        .padding()
    }
}