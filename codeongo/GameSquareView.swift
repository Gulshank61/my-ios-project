import SwiftUI

struct GameSquareView: View {
    var action: () -> Void
    var player: Player?
    
    var body: some View {
        Button(action: action) {
            Text(player?.rawValue ?? "")
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}