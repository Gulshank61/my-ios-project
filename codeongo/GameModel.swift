import SwiftUI

class GameModel: ObservableObject {
    @Published var tiles: [[TileState]]
    
    init() {
        self.tiles = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
    
    func restartGame() {
        tiles = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
    
    var isBoardFull: Bool {
        for row in tiles {
            for tile in row where tile == .empty {
                return false
            }
        }
        return true
    }
}