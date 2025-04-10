import Foundation

enum TileState: String {
    case empty, x, o
    
    var imageName: String {
        switch self {
        case .empty:
            return "photo"
        case .x:
            return "xImage"
        case .o:
            return "oImage"
        }
    }
}