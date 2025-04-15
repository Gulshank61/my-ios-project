import SwiftUI

struct ContentView: View {
    @ObservedObject var featureActionButtonHandler: FeatureButtonActionHandler
    @State private var gameModel = TicTacToeGameModel()

    var body: some View {
        VStack {
            GameBoardView(gameModel: $gameModel)
            Button("Make Payment") {
                featureActionButtonHandler.makePayment()
            }
            .alert(isPresented: $featureActionButtonHandler.showAlert) {
                Alert(title: Text("Payment Status"), message: Text(featureActionButtonHandler.alertMessage))
            }
        }
    }
}