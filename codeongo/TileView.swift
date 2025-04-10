import SwiftUI

struct TileView: View {
    @Binding var tileState: TileState
    
    var body: some View {
        Button(action: {
            tileState.toggle()
        }) {
            Image(uiImage: tileState.image)
                .resizable()
                .scaledToFit()
        }
    }
}