import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var featureActionButtonHandler = FeatureButtonActionHandler()

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, please login")
                .font(.largeTitle)

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                // Handle login functionality here
                print("Login attempt...")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)

            Button("Make Payment") {
                featureActionButtonHandler.makePayment()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(8)

            Button("Send Email") {
                featureActionButtonHandler.sendEmail()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.orange)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $featureActionButtonHandler.showAlert) {
            Alert(title: Text("Notification"), message: Text(featureActionButtonHandler.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}