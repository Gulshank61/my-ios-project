import SwiftUI

struct CarView: View {
    let position: CGFloat
    var screenSize: CGSize
    
    var body: some View {
        Image("redCar")
            .resizable()
            .scaledToFit()
            .frame(width: screenSize.width / 5)
            .position(x: position, y: screenSize.height / 2)
    }
}