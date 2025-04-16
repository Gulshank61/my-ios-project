import SwiftUI

struct AlertView: View {
    var message: String
    var resetAction: () -> Void

    var body: some View {
        VStack {
            Text(message)
                .font(.title)
                .padding()
            Button(action: resetAction) {
                Text("Reset")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}