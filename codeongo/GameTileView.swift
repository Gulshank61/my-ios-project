import SwiftUI

struct GameTileView: View {
    @Binding var tileState: TileState

    var body: some View {
        Button(action: {
            if tileState == .empty {
                tileState = .x
            } else if tileState == .x {
                tileState = .o
            } else {
                tileState = .empty
            }
        }) {
            Image(systemName: tileState.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}