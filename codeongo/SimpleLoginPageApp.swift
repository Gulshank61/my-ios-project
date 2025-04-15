import SwiftUI

@main
struct SimpleLoginPageApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(FeatureButtonActionHandler())
        }
    }
}