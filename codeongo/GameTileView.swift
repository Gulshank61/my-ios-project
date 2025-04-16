import SwiftUI

struct GameTileView: View {
    @Binding var tile: TileState

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle().foregroundColor(.white)
                Text(tile.symbol)
                    .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
                    .foregroundColor(tile == .x ? .red : .blue)
            }
        }
        .border(Color.black, width: 2)
    }
}