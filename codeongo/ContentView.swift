import SwiftUI

struct ContentView: View {
    @State private var carPositionY: CGFloat = UIScreen.main.bounds.height / 2

    var body: some View {
        ZStack {
            // Road background
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            // Car image
            Image("redCar")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 200)
                .position(x: UIScreen.main.bounds.width / 2, y: carPositionY)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            carPositionY = gesture.location.y
                        }
                )
        }
        .edgesIgnoringSafeArea(.all)
    }
}