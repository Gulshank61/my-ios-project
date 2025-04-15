import SwiftUI

struct GameSquareView: View {
    @Binding var player: Player?

    var body: some View {
        ZStack {
            if let player = player {
                Text(player.symbol)
                    .font(.largeTitle)
                    .foregroundColor(player == .x ? .red : .green)
            }
        }
    }
}