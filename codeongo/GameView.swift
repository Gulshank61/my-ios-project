import SwiftUI

struct GameView: View {
    @StateObject var gameModel = GameModel()
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3, id: \.self) { column in
                        GameTileView(tileState: $gameModel.tiles[row][column])
                    }
                }
            }
            Button("Restart Game") {
                gameModel.restartGame()
            }
            .padding()
        }
    }
}