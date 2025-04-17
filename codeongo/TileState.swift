import Foundation

enum Player: String {
    case x = "X"
    case o = "O"

    var symbol: String {
        self.rawValue
    }

    mutating func toggle() {
        self = (self == .x) ? .o : .x
    }
}

enum TileState: Equatable {
    case empty
    case filled(player: Player)

    var symbol: String {
        switch self {
        case .empty:
            return " "
        case .filled(let player):
            return player.symbol
        }
    }
    
    static func == (lhs: TileState, rhs: TileState) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.filled(let a), .filled(let b)):
            return a == b
        default:
            return false
        }
    }

    init(player: Player) {
        self = .filled(player: player)
    }
}