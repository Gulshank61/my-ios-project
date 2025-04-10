import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var tiles: [[TileState]]
    
    init() {
        tiles = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
    
    func resetGame() {
        tiles = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
}

enum TileState {
    case x, o, empty
    
    mutating func toggle() {
        switch self {
        case .x:
            self = .o
        case .o, .empty:
            self = .x
        }
    }
    
    var image: UIImage {
        switch self {
        case .x:
            return UIImage(named: "xImage.png")!
        case .o:
            return UIImage(named: "oImage.png")!
        case .empty:
            return UIImage()
        }
    }
}