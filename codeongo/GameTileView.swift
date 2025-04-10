import SwiftUI

struct GameTileView: View {
    @Binding var tileState: TileState
    
    var body: some View {
        Button(action: {
            tileState = tileState.next()
        }) {
            Image(tileState.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
        .buttonStyle(PlainButtonStyle())
    }
}