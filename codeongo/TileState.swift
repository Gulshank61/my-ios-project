import Foundation

enum TileState {
    case empty
    case x
    case o
    
    var imageName: String {
        switch self {
        case .empty:
            return "emptyImage"
        case .x:
            return "xImage"
        case .o:
            return "oImage"
        }
    }
    
    func next() -> TileState {
        switch self {
        case .empty:
            return .x
        case .x:
            return .o
        case .o:
            return .empty
        }
    }
}