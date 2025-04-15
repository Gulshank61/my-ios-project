import SwiftUI

struct TileView: View {
    @Binding var tileState: TileState

    var body: some View {
        ZStack {
            Rectangle().fill(tileState.color)
            Text(tileState.symbol)
        }
        .foregroundColor(.black)
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}

extension TileState {
    var symbol: String {
        switch self {
        case .empty:
            return ""
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }

    var color: Color {
        switch self {
        case .empty:
            return .white
        case .x, .o:
            return .clear
        }
    }
}