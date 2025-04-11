import SwiftUI

struct ContentView: View {
    @StateObject private var gameController = GameController()
    
    var body: some View {
        VStack {
            Spacer()
            CarView(car: $gameController.playerCar)
                .frame(width: 100, height: 200)
            Spacer()
            Button("Move Right") {
                gameController.moveCarRight()
            }
            .padding()
            Button("Move Left") {
                gameController.moveCarLeft()
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct CarView: View {
    @Binding var car: Car
    
    var body: some View {
        Image(car.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 200)
            .position(x: car.position.x, y: car.position.y)
    }
}