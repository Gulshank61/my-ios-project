import SwiftUI

struct GameSquareView: View {
    @Binding var player: GameViewModel.Player
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if player == .x {
                    Text("X")
                        .font(.system(size: geometry.size.width * 0.8))
                        .bold()
                } else if player == .o {
                    Text("O")
                        .font(.system(size: geometry.size.width * 0.8))
                        .bold()
                }
            }
        }
    }
}