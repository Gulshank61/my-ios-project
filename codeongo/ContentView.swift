import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManager = GameManager(redCarImage: "redCar")

    var body: some View {
        ZStack {
            RoadView()
            CarView(position: gameManager.carPosition)
        }
        .gesture(DragGesture().onChanged { gesture in
            gameManager.moveCar(xTranslation: gesture.translation.width)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

// FILE: GameManager.swift
import Foundation
import SwiftUI

class GameManager: ObservableObject {
    @Published var carPosition = CGPoint(x: 0, y: 0)
    private var redCarImageName: String
    
    init(redCarImage: String) {
        self.redCarImageName = redCarImage
        setupGame()
    }
    
    private func setupGame() {
        // Initial car position setup
        carPosition = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY - 150)
    }
    
    func moveCar(xTranslation: CGFloat) {
        let newXPosition = carPosition.x + xTranslation
        let maxX = UIScreen.main.bounds.width - 50
        if newXPosition > 50 && newXPosition < maxX {
            carPosition.x = newXPosition
        }
    }
}

// FILE: RoadView.swift
import SwiftUI

struct RoadView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLines([
                    CGPoint(x: width * 0.3, y: 0),
                    CGPoint(x: width * 0.7, y: 0),
                    CGPoint(x: width * 0.7, y: height),
                    CGPoint(x: width * 0.3, y: height),
                ])
            }
            .fill(Color.gray)
            .opacity(0.3)
        }
    }
}

// FILE: CarView.swift
import SwiftUI

struct CarView: View {
    var position: CGPoint
    private let imageSize = CGSize(width: 50, height: 100)

    var body: some View {
        Image("redCar")
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .position(position)
    }
}

// FILE: RedCarApp.swift
import SwiftUI

@main
struct RedCarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}