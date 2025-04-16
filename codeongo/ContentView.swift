import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                ForEach(0..<9) { index in
                    GameSquareView(player: $viewModel.squares[index])
                        .frame(width: 90, height: 90)
                        .background(viewModel.squares[index] == .none ? Color.gray.opacity(0.5) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            viewModel.processPlayerMove(for: index)
                        }
                }
            }
            .padding()
            .disabled(viewModel.isGameboardDisabled)

            Button(action: viewModel.resetGame) {
                Text("New Game")
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .alert(isPresented: $viewModel.alertIsVisible) {
            Alert(title: Text("Game Over"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Reset"), action: viewModel.resetGame))
        }
    }
}