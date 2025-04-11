import SwiftUI

class GameViewModel: ObservableObject {
    @Published var carPosition: CGFloat = UIScreen.main.bounds.midX
    @Published var isGameOver: Bool = false

    private var screenWidth = UIScreen.main.bounds.width
    private let carWidth: CGFloat = 60.0
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    func updateCarPosition(translation: CGSize) {
        let newPosition = carPosition + translation.width
        if newPosition > (screenWidth - carWidth / 2) || newPosition < (carWidth / 2) {
            isGameOver = true
            timer.upstream.connect().cancel()
        } else {
            carPosition = newPosition
        }
    }
    
    func updateGame() {
        // Add any sequential game updates here if needed
    }

    func restartGame() {
        isGameOver = false
        carPosition = UIScreen.main.bounds.midX
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
}