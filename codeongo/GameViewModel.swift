import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var carPosition: CGFloat = 0.0
    
    private var screenSize: CGSize = .zero
    private var subscriptions: Set<AnyCancellable> = []
    
    func startGame() {
        Timer.publish(every: 1/60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                // Game timer functionality
            }
            .store(in: &subscriptions)
    }
    
    func updateCarPosition(xTranslation: CGFloat, screenSize: CGSize) {
        self.screenSize = screenSize
        let newPosition = carPosition + xTranslation
        
        // Prevent car from going off-screen
        carPosition = min(max(newPosition, 0), screenSize.width)
    }
}