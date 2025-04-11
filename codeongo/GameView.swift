import SwiftUI

struct GameView: View {
    @StateObject var gameViewModel = GameViewModel()

    var body: some View {
        ZStack {
            RoadView()
            CarView(carPosition: $gameViewModel.carPosition)
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    gameViewModel.updateCarPosition(translation: gesture.translation)
                }
        )
        .onReceive(gameViewModel.timer) { _ in
            gameViewModel.updateGame()
        }
        .alert(isPresented: $gameViewModel.isGameOver) {
            Alert(
                title: Text("Game Over"),
                message: Text("You hit the side!"),
                dismissButton: .default(Text("Restart")) {
                    gameViewModel.restartGame()
                }
            )
        }
    }
}