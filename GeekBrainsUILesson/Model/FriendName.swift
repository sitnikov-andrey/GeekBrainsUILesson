import Foundation

enum FriendName: Int, CaseIterable {
    case a, e, m, o
        
    static let allLetters: [FriendName] = [a, e, m, o]
        
        var title: String {
            switch self {
            case .a: return "А"
            case .e: return "Е"
            case .m: return "М"
            case .o: return "О"
            }
        }
    
    static var allStrings: [String] {
        return FriendName.allLetters.map { $0.title }
    }
}
