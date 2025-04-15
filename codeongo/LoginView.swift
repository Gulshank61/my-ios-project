import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var handler = FeatureButtonActionHandler()

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button("Pay Now") {
                handler.makePayment()
            }
            
            Button("Pay Now") {
                handler.sendEmail()
            }
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Perform login action
                print("Login button tapped")
            }) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $handler.showAlert) {
            Alert(title: Text("Payment"), message: Text(handler.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
