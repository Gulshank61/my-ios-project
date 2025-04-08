import SwiftUI

struct TileView: View {
    @Binding var tile: TileState
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color.white
                tile.image?.resizable()
            }
        }
        .frame(width: 100, height: 100)
        .buttonStyle(.borderless)
    }
}