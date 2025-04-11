import SwiftUI
import Combine

class GameController: ObservableObject {
    @Published var playerCar: Car
    
    init() {
        self.playerCar = Car(position: CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY - 100), imageName: "redCar")
    }
    
    func moveCarRight() {
        withAnimation {
            playerCar.position.x = min(playerCar.position.x + 50, UIScreen.main.bounds.maxX - 50)
        }
    }
    
    func moveCarLeft() {
        withAnimation {
            playerCar.position.x = max(playerCar.position.x - 50, 50)
        }
    }
}