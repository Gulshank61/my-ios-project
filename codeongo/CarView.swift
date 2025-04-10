import SwiftUI

struct CarView: View {
    var body: some View {
        Image("carImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}