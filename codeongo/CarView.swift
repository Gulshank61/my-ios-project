import SwiftUI

struct CarView: View {
    @Binding var carPosition: CGFloat

    var body: some View {
        Image("redCar")
            .resizable()
            .frame(width: 60, height: 120)
            .position(x: carPosition, y: UIScreen.main.bounds.height - 150)
    }
}