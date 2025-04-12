import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel = GameViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                CarView(position: viewModel.carPosition, screenSize: geometry.size)
                    .frame(width: geometry.size.width, height: 100)
                Spacer()
            }
            .background(Color.green.edgesIgnoringSafeArea(.all))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewModel.updateCarPosition(xTranslation: value.translation.width, screenSize: geometry.size)
                    }
            )
        }
        .onAppear {
            viewModel.startGame()
        }
    }
}