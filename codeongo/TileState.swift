import Foundation

enum TileState: Equatable {
    case empty
    case x
    case o

    var symbol: String {
        switch self {
        case .empty: return " "
        case .x: return "X"
        case .o: return "O"
        }
    }
}