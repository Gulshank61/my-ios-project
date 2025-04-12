import SwiftUI

struct TileView: View {
    @Binding var state: TileState
    
    var body: some View {
        Button(action: {
            if state == .empty {
                state = .x
            }
        }) {
            Image(state == .x ? "xImage" : (state == .o ? "oImage" : "empty"))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 100, height: 100)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}