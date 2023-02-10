import Foundation

struct ArtistModel: Codable {
    let id, name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
