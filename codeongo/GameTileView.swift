import SwiftUI

struct GameTileView: View {
    var tileState: TileState
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            switch tileState {
            case .empty:
                Color.clear
            case .occupied(let player):
                Text(player == .x ? "X" : "O")
                    .font(.largeTitle)
                    .foregroundColor(player == .x ? .red : .blue)
            }
        }
        .frame(width: 80, height: 80, alignment: .center)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}