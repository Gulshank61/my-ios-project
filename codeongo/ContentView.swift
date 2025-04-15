import SwiftUI

struct ContentView: View {
    @StateObject var featureActionButtonHandler = FeatureButtonActionHandler()
    @StateObject private var game = GameModel()

    var body: some View {
        VStack {
            GameBoardView(game: game)
            Spacer()
            makePaymentButton
                .alert(isPresented: $featureActionButtonHandler.showAlert) {
                    Alert(title: Text("Alert"), message: Text(featureActionButtonHandler.alertMessage), dismissButton: .default(Text("OK")))
                }
        }
        .padding()
    }

    private var makePaymentButton: some View {
        Button("Make Payment") {
            featureActionButtonHandler.makePayment()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}