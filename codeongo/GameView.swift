import SwiftUI

struct GameView: View {
    @State private var carPosition: CGFloat = 0.5 // Middle of the screen
    private let moveAmount: CGFloat = 0.1
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                CarView()
                    .frame(width: 64, height: 64)
                    .position(x: geometry.size.width * carPosition, y: geometry.size.height * 0.8)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        moveCar(toLeft: true)
                    }) {
                        Text("<")
                            .font(.largeTitle)
                            .frame(width: 64, height: 64)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        moveCar(toLeft: false)
                    }) {
                        Text(">")
                            .font(.largeTitle)
                            .frame(width: 64, height: 64)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
    }
    
    func moveCar(toLeft: Bool) {
        if toLeft {
            carPosition = max(0, carPosition - moveAmount)
        } else {
            carPosition = min(1, carPosition + moveAmount)
        }
    }
}