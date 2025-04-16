import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var featureActionButtonHandler = FeatureButtonActionHandler()

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Make Payment") {
                featureActionButtonHandler.makePayment()
            }
            .padding()
            .alert(isPresented: $featureActionButtonHandler.showAlert) {
                Alert(title: Text("Alert"), message: Text(featureActionButtonHandler.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
}