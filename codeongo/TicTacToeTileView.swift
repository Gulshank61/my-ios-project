import SwiftUI

struct TicTacToeTileView: View {
    @Binding var tileState: TileState

    var body: some View {
        ZStack {
            Color.white
            Text(tileState.symbol)
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}