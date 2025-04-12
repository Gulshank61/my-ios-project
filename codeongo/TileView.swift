import SwiftUI

struct TileView: View {
    @Binding var state: TileState

    var body: some View {
        switch state {
        case .empty:
            Color.clear
        case .x:
            Text("X")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
        case .o:
            Text("O")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
    }
}