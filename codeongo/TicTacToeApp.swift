import SwiftUI

@main
struct TicTacToeApp: App {
    @StateObject private var featureActionButtonHandler = FeatureButtonActionHandler()

    var body: some Scene {
        WindowGroup {
            ContentView(featureActionButtonHandler: featureActionButtonHandler)
        }
    }
}