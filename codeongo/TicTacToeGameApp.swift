import SwiftUI

@main
struct TicTacToeGameApp: App {
    @StateObject private var gameModel = GameModel()
    @StateObject private var featureActionButtonHandler = FeatureButtonActionHandler()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                GameBoardView(gameModel: gameModel)
                Button("Make Payment") {
                    featureActionButtonHandler.makePayment()
                }
                .alert(isPresented: $featureActionButtonHandler.showAlert) {
                    Alert(title: Text("Alert"), message: Text(featureActionButtonHandler.alertMessage))
                }
            }
        }
    }
}