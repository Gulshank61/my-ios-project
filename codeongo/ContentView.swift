import SwiftUI

struct ContentView: View {
    @State private var carPosition: CGFloat = UIScreen.main.bounds.midY
    @State private var isGameOver = false
    @State private var obstacles: [Obstacle] = []
    
    let carWidth: CGFloat = 60
    let carHeight: CGFloat = 120
    let obstacleWidth: CGFloat = 60
    let obstacleHeight: CGFloat = 120
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("redCar")
                    .resizable()
                    .frame(width: carWidth, height: carHeight)
                    .position(x: geometry.size.width / 2, y: carPosition)
                
                ForEach(obstacles) { obstacle in
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: obstacleWidth, height: obstacleHeight)
                        .position(x: obstacle.position.x, y: obstacle.position.y)
                        .onReceive(timer) { _ in
                            if isGameOver == false {
                                moveObstacle(obstacle: obstacle, maxWidth: geometry.size.width)
                            }
                        }
                }.onAppear {
                    setupObstacles(maxWidth: geometry.size.width)
                }
                
                if isGameOver {
                    Text("Game Over")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red)
                }
            }
        }.gesture(DragGesture().onChanged { value in
            carPosition = value.location.y
        })
        .onReceive(timer) { _ in
            checkCollision(maxHeight: UIScreen.main.bounds.height)
        }
    }
    
    func setupObstacles(maxWidth: CGFloat) {
        for _ in 1...5 {
            let xPos = CGFloat.random(in: 0...maxWidth)
            let yPos = CGFloat.random(in: -300...0)
            obstacles.append(Obstacle(id: UUID(), position: CGPoint(x: xPos, y: yPos)))
        }
    }
    
    func moveObstacle(obstacle: Obstacle, maxWidth: CGFloat) {
        if var foundObstacle = obstacles.first(where: { $0.id == obstacle.id }) {
            foundObstacle.position.y += 20
            if foundObstacle.position.y > UIScreen.main.bounds.height {
                foundObstacle.position.y = CGFloat.random(in: -100...0)
                foundObstacle.position.x = CGFloat.random(in: 0...maxWidth)
            }
        }
    }
    
    func checkCollision(maxHeight: CGFloat) {
        for obstacle in obstacles {
            if abs(obstacle.position.y - carPosition) < (carHeight / 2 + obstacleHeight / 2) &&
               obstacle.position.x == UIScreen.main.bounds.width / 2 {
                isGameOver = true
                timer.upstream.connect().cancel()
            }
        }
    }
}

struct Obstacle: Identifiable {
    let id: UUID
    var position: CGPoint
}